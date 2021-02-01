import 'package:notifier/firebase.dart';
import 'package:notifier/model/index.dart';
import 'package:notifier/ui/all.dart';

class AlarmsPage extends StatefulWidget {
  @override
  _AlarmsPageState createState() => _AlarmsPageState();
}

class _AlarmsPageState extends State<AlarmsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  DatabaseReference _alarmsRef;
  Stream<ScheduleAlarms> _alarmsStream;

  @override
  void initState() {
    super.initState();

    _alarmsRef = database.reference().child('/alarms/${auth.currentUser.uid}');
    _alarmsStream = _alarmsRef.onValue.map<ScheduleAlarms>((Event event) {
      final Map<dynamic, dynamic> json =
          event.snapshot.value as Map<dynamic, dynamic>;
      return json == null
          ? null
          : ScheduleAlarms.fromJson(<dynamic, dynamic>{'alarms': json});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<ScheduleAlarms>(
      stream: _alarmsStream,
      builder: (BuildContext context, AsyncSnapshot<ScheduleAlarms> snapshot) {
        final List<ScheduleAlarm> alarms =
            snapshot.data?.alarms?.values?.toList();

        final Widget body = Scaffold(
          body: SingleChildScrollView(
            padding: scrollableBodyPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'スケジュールアラーム',
                  style: context.textTheme.headline6,
                ),
                if (alarms?.isNotEmpty ?? false)
                  _buildScheduleAlarms(context, alarms)
                else
                  Text('まだアラームが設定されていません。'),
                RaisedButton(
                  onPressed: () async {
                    await context.push<void>(
                        (_) => CreateAlarmPage(alarmsRef: _alarmsRef));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.add),
                      Text('アラームを追加する'),
                    ].intersperseSpacing(const EdgeInsets.only(left: 6.0)),
                  ),
                ),

                // TODO: League ranking alarms
              ].intersperseSpacing(const EdgeInsets.only(top: 12.0)),
            ),
          ),
        );

        return body;
      },
    );
  }

  Widget _buildScheduleAlarms(
    BuildContext context,
    List<ScheduleAlarm> alarms,
  ) {
    final Widget listView = ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: alarms.length,
      itemBuilder: (BuildContext context, int i) {
        final ScheduleAlarm alarm = alarms[i];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 6.0,
          ),
          onTap: () {
            print('To be implemented.');
          },
          title: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: <TableRow>[
              for (final MapEntry<int, _ScheduleRow> row in <_ScheduleRow>[
                _ScheduleRow(
                  context.S.modes,
                  contents: alarm.modes.map(translateModeName),
                ),
                _ScheduleRow(
                  context.S.rules,
                  contents: alarm.rules.map(translateRuleName),
                ),
                _ScheduleRow(
                  context.S.stages,
                  content: alarm.stages.length.toString(),
                ),
              ].asMap().entries)
                TableRow(
                  children: <Widget>[
                    Text(row.value.label, textAlign: TextAlign.end),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(row.value.normalizedContent),
                    ),
                  ],
                ),
            ],
          ),
          trailing: IconButton(
            color: AppColors.error,
            icon: const Icon(Icons.close),
            onPressed: () {
              print('To be implemented.');
            },
          ),
        );
      },
    );

    return Theme(
      data: ThemeData(
        textTheme: context.textTheme.copyWith(
          subtitle1: context.textTheme.bodyText2,
        ),
      ),
      child: listView,
    );
  }
}

class _ScheduleRow {
  const _ScheduleRow(this.label, {this.content, this.contents});

  final String label;
  final String content;
  final Iterable<String> contents;

  String get normalizedContent => content ?? contents.join(', ');
}
