import 'package:built_collection/built_collection.dart';
import 'package:notifier/firebase.dart';
import 'package:notifier/model/index.dart';
import 'package:notifier/model/values.dart';
import 'package:notifier/ui/all.dart';

class CreateAlarmPage extends StatefulWidget {
  const CreateAlarmPage({@required this.alarmsRef});

  final DatabaseReference alarmsRef;

  @override
  _CreateAlarmPageState createState() => _CreateAlarmPageState();
}

bool _hasAnyTrueNotifier(Iterable<ValueNotifier<bool>> notifiers) {
  return notifiers.any((ValueNotifier<bool> notifier) => notifier.value);
}

const List<GameMode> rankedModes = <GameMode>[GameMode.gachi, GameMode.league];

enum _TimeUnit {
  minute,
  hour,
}

class _AlarmTiming {
  const _AlarmTiming(this._unit, this._amount);

  final _TimeUnit _unit;
  final int _amount;

  int get inMinute {
    switch (_unit) {
      case _TimeUnit.hour:
        return 60 * _amount;
      case _TimeUnit.minute:
        return _amount;
    }
  }

  String localize(BuildContext context) {
    switch (_unit) {
      case _TimeUnit.hour:
        return context.S.nHourBefore(_amount);
      case _TimeUnit.minute:
        return context.S.nMinuteBefore(_amount);
    }
  }
}

class _CreateAlarmPageState extends State<CreateAlarmPage> {
  final Map<GameMode, ValueNotifier<bool>> _modeControllers =
      <GameMode, ValueNotifier<bool>>{};
  final ValueNotifier<Set<int>> _stagesController =
      ValueNotifier<Set<int>>(<int>{});
  final Map<GameRule, ValueNotifier<bool>> _ruleControllers =
      <GameRule, ValueNotifier<bool>>{};
  final ValueNotifier<Set<int>> _timingsController =
      ValueNotifier<Set<int>>(<int>{});

  Iterable<ValueNotifier<bool>> get _rankedModeControllers {
    return rankedModes.map((GameMode mode) => _modeControllers[mode]);
  }

  @override
  void initState() {
    super.initState();

    for (final GameMode mode in GameMode.values) {
      _modeControllers[mode] = ValueNotifier<bool>(false);
    }

    for (final GameRule rule in GameRule.values) {
      _ruleControllers[rule] = ValueNotifier<bool>(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Listenable rankedModesListener = Listenable.merge(
      <ValueNotifier<bool>>[
        for (final GameMode mode in rankedModes) _modeControllers[mode],
      ],
    );
    final Listenable allListeners = Listenable.merge(<Listenable>[
      ..._modeControllers.values,
      _stagesController,
      ..._ruleControllers.values,
      _timingsController,
    ]);

    final Widget body = ListView(
      padding: scrollableBodyPadding,
      children: <Widget>[
        // Modes
        Text(context.S.modes, style: boldTextStyle),
        _buildModeOptions(context),

        // Rules
        AnimatedBuilder(
          animation: rankedModesListener,
          builder: (BuildContext context, _) {
            if (_hasAnyTrueNotifier(_rankedModeControllers)) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 18.0)),
                  Text(context.S.rules, style: boldTextStyle),
                  _buildRuleOptions(context),
                ],
              );
            }

            return Container();
          },
        ),

        // Stages
        const Padding(padding: EdgeInsets.only(top: 12.0)),
        ValueListenableBuilder<Set<int>>(
          valueListenable: _stagesController,
          builder: (BuildContext context, Set<int> value, Widget child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    child,
                    Text(
                      '(${value.length}/$KNOWN_STAGES)',
                      style: TextStyle(
                        fontSize: context.textTheme.bodyText2.fontSize * 0.8,
                      ),
                    ),
                  ].intersperseSpacing(const EdgeInsets.only(left: 9.0)),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (value.isEmpty) {
                      _stagesController.value.addAll(stageIds);
                    } else {
                      _stagesController.value.clear();
                    }
                    _stagesController.notifyListeners();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      value.isEmpty
                          ? context.S.toSelectAll
                          : context.S.toUnselectAll,
                      style: TextStyle(
                          fontSize: context.textTheme.bodyText2.fontSize * 0.8),
                    ),
                  ),
                ),
              ],
            );
          },
          child: Text(context.S.stages, style: boldTextStyle),
        ),
        const Padding(padding: EdgeInsets.only(top: 9.0)),
        _buildStagesOptions(context),

        // Timings
        const Padding(padding: EdgeInsets.only(top: 12.0)),
        Text(context.S.notificationTimings, style: boldTextStyle),
        const Padding(padding: EdgeInsets.only(top: 9.0)),
        ValueListenableBuilder<Set<int>>(
          valueListenable: _timingsController,
          builder: (BuildContext context, _, __) =>
              _buildTimingOptions(context),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.S.titleCreateAlarm),
        actions: <Widget>[
          AnimatedBuilder(
            animation: allListeners,
            builder: (BuildContext context, Widget label) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ButtonTheme.fromButtonThemeData(
                  data: context.theme.buttonTheme.copyWith(
                    minWidth: 0,
                  ),
                  child: RaisedButton(
                    onPressed: canSave ? () => _save(context) : null,
                    child: label,
                  ),
                ),
              );
            },
            child: Text(context.S.toSave),
          ),
        ],
      ),
      body: body,
    );
  }

  Widget _buildModeOptions(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildModeOption(context, GameMode.regular, context.S.regularBattle),
        _buildModeOption(context, GameMode.gachi, context.S.rankedBattle),
        _buildModeOption(context, GameMode.league, context.S.leagueBattle),
      ],
    );
  }

  Widget _buildModeOption(BuildContext context, GameMode mode, String label) {
    final ValueNotifier<bool> controller = _modeControllers[mode];

    return _buildCheckboxRow(context, controller, label);
  }

  Widget _buildRuleOptions(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildRuleOption(context, GameRule.splatZones, context.S.splatZones),
        _buildRuleOption(
            context, GameRule.towerControl, context.S.towerControl),
        _buildRuleOption(context, GameRule.rainmaker, context.S.rainmaker),
        _buildRuleOption(context, GameRule.clamBlitz, context.S.clamBlitz),
      ],
    );
  }

  Widget _buildRuleOption(BuildContext context, GameRule rule, String label) {
    final ValueNotifier<bool> controller = _ruleControllers[rule];

    return _buildCheckboxRow(context, controller, label);
  }

  Widget _buildStagesOptions(BuildContext context) {
    final Set<int> selected = _stagesController.value;

    return ValueListenableBuilder<Set<int>>(
      valueListenable: _stagesController,
      builder: (BuildContext context, _, __) => Column(
        children: <Widget>[
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: STAGE_IMAGE_ASPECT_RATIO,
            children: <Widget>[
              for (final int stageId in stageIds)
                GestureDetector(
                  onTap: () {
                    selected.toggle(stageId);
                    _stagesController.notifyListeners();
                  },
                  child: Opacity(
                    opacity: selected.contains(stageId) ? 1.0 : 0.22,
                    child: StageWidget(
                      stageId: stageId,
                      showName: false,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimingOptions(BuildContext context) {
    const List<_AlarmTiming> options = <_AlarmTiming>[
      _AlarmTiming(_TimeUnit.minute, 15),
      _AlarmTiming(_TimeUnit.minute, 30),
      _AlarmTiming(_TimeUnit.hour, 1),
      _AlarmTiming(_TimeUnit.hour, 2),
      _AlarmTiming(_TimeUnit.hour, 4),
      _AlarmTiming(_TimeUnit.hour, 8),
      _AlarmTiming(_TimeUnit.hour, 24),
    ];

    void toggleTimingsController(int value) {
      _timingsController.value.toggle(value);
      _timingsController.notifyListeners();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (final _AlarmTiming option in options)
          GestureDetector(
            onTap: () => toggleTimingsController(option.inMinute),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: _timingsController.value.contains(option.inMinute),
                  onChanged: (_) => toggleTimingsController(option.inMinute),
                ),
                Text(option.localize(context)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildCheckboxRow(
    BuildContext context,
    ValueNotifier<bool> controller,
    String label,
  ) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller,
      builder: (_, bool currentValue, Widget labelWidget) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => controller.value = !currentValue,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: currentValue,
              onChanged: (bool value) => controller.value = !currentValue,
            ),
            labelWidget,
          ],
        ),
      ),
      child: Text(label),
    );
  }

  @visibleForTesting
  bool get canSave {
    if (_stagesController.value.isNotEmpty &&
        _hasAnyTrueNotifier(_modeControllers.values)) {
      // No rule is required when regular is only selected mode
      final bool requireRuleSelection =
          _hasAnyTrueNotifier(_rankedModeControllers);

      if (requireRuleSelection &&
          !_hasAnyTrueNotifier(_ruleControllers.values)) {
        return false;
      }

      return _timingsController.value.isNotEmpty;
    }

    return false;
  }

  Future<void> _save(BuildContext context) async {
    final ScheduleAlarmBuilder scheduleAlarmBuilder = ScheduleAlarmBuilder()
      ..modes = BuiltSet<GameMode>.of(
        _modeControllers.entries.where((e) => e.value.value).map((e) => e.key),
      ).toBuilder()
      ..rules = BuiltSet<GameRule>.of(
        _ruleControllers.entries.where((e) => e.value.value).map((e) => e.key),
      ).toBuilder()
      ..stagesRaw = BuiltSet<int>.of(_stagesController.value).toBuilder()
      ..timings = BuiltSet<int>.of(_timingsController.value).toBuilder();
    final Map<String, dynamic> json = scheduleAlarmBuilder.build().toJson();

    try {
      await widget.alarmsRef.push().set(json).timeout(connectionTimeout);

      return Navigator.pop(context);
    } catch (_) {
      await context.showErrorDialog(
        message: context.S.errorSave(context.S.alarm),
      );
    }
  }
}
