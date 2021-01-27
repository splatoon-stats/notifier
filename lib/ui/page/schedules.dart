import 'package:notifier/firebase.dart';
import 'package:notifier/model/index.dart';
import 'package:notifier/ui/all.dart';

class SchedulesPage extends StatefulWidget {
  @override
  _SchedulesPageState createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  static const List<Color> _tabColors = <Color>[
    AppColors.regularBattle,
    AppColors.rankedBattle,
    AppColors.leagueBattle,
  ];

  final Stream<Schedules> _schedulesStream = database
      .reference()
      .child('schedules')
      .onValue
      .map<Schedules>((Event event) {
    final Map<dynamic, dynamic> json =
        event.snapshot.value as Map<dynamic, dynamic>;
    return json == null ? null : Schedules.fromJson(json);
  });

  TabController _tabBarController;
  Rainbow _rainbow;

  @override
  void initState() {
    super.initState();

    _tabBarController = TabController(
      length: 3,
      vsync: this,
    );

    _rainbow = Rainbow(
      spectrum: _tabColors,
      rangeEnd: 2.0,
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: <Widget>[
        _buildTabBar(),
        Expanded(
          child: StreamBuilder<Schedules>(
            stream: _schedulesStream,
            builder: (BuildContext context, AsyncSnapshot<Schedules> snapshot) {
              if (snapshot.hasError) {
                return ErrorText(context.S.errorLoad(context.S.schedules));
              } else if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final Schedules allSchedules = snapshot.data;

              return TabBarView(
                controller: _tabBarController,
                children: <Widget>[
                  SchedulesWidget(schedules: allSchedules.regular.toList()),
                  SchedulesWidget(
                    schedules: allSchedules.gachi.toList(),
                    isRanked: true,
                  ),
                  SchedulesWidget(
                    schedules: allSchedules.league.toList(),
                    isRanked: true,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return AnimatedBuilder(
      animation: _tabBarController.animation,
      builder: (BuildContext context, _) {
        return TabBar(
          controller: _tabBarController,
          labelPadding: EdgeInsets.zero,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 4.0,
                color: _rainbow[_tabBarController.animation.value],
              ),
            ),
          ),
          tabs: <Widget>[
            Tab(text: context.S.regularBattle),
            Tab(text: context.S.rankedBattle),
            Tab(text: context.S.leagueBattle),
          ],
        );
      },
    );
  }
}

class SchedulesWidget extends StatelessWidget {
  const SchedulesWidget({
    Key key,
    @required this.schedules,
    this.isRanked = false,
  }) : super(key: key);

  final List<Schedule> schedules;
  final bool isRanked;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: scrollableBodyPadding,
      child: Column(
        children: <Widget>[
          for (final Schedule schedule in schedules)
            _buildSchedule(context, schedule),
        ].intersperseSpacing(const EdgeInsets.only(top: 30.0)),
      ),
    );
  }

  Widget _buildSchedule(BuildContext context, Schedule schedule) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat.Hm().format(schedule.startTime),
              style: context.textTheme.headline5,
            ),
            if (isRanked)
              Text(
                schedule.rule.key,
                style: context.textTheme.headline5.copyWith(
                  fontSize: context.textTheme.headline5.fontSize * 0.8,
                ),
              ),
          ].intersperseSpacing(const EdgeInsets.only(left: 12.0)),
        ),
        Row(
          children: <Widget>[
            _buildStage(schedule.stageA),
            _buildStage(schedule.stageB),
          ],
        ),
      ].intersperseSpacing(const EdgeInsets.only(top: 6.0)),
    );
  }

  Widget _buildStage(Stage stage) {
    return Flexible(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          StageImage(stage.image),
          Row(
            children: <Widget>[
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  child: Center(child: Text(stage.id.toString())),
                ),
              ),
            ],
          ),
        ],
      ),
      flex: 1,
    );
  }
}
