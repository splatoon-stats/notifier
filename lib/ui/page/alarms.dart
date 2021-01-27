import 'package:notifier/firebase.dart';
import 'package:notifier/model/index.dart';
import 'package:notifier/provider/all.dart';
import 'package:notifier/ui/all.dart';

class AlarmsPage extends StatefulWidget {
  @override
  _AlarmsPageState createState() => _AlarmsPageState();
}

class _AlarmsPageState extends State<AlarmsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Stream<ScheduleAlarms> _alarmsRef = database
      .reference()
      .child('/users/${auth.currentUser.uid}/alarms')
      .onValue
      .map<ScheduleAlarms>((Event event) {
    final Map<dynamic, dynamic> json =
        event.snapshot.value as Map<dynamic, dynamic>;
    return json == null ? null : ScheduleAlarms.fromJson(json);
  });

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final User user = context
        .select<UserProvider, User>((UserProvider provider) => provider.user);

    return StreamBuilder<ScheduleAlarms>(
      stream: _alarmsRef,
      builder: (BuildContext context, AsyncSnapshot<ScheduleAlarms> snapshot) {
        final List<ScheduleAlarm> alarms = snapshot.data?.alarms?.toList();

        final Widget body = Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'スケジュールアラーム',
                style: context.textTheme.headline6,
              ),
              if (alarms?.isNotEmpty ?? false)
                ..._buildScheduleAlarms(context, alarms)
              else
                Text('まだアラームが設定されていません。'),
              RaisedButton(
                onPressed: () {},
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
        );

        return Padding(
          padding: scrollableBodyPadding,
          child: body,
        );
      },
    );
  }

  List<Widget> _buildScheduleAlarms(
    BuildContext context,
    List<ScheduleAlarm> alarms,
  ) {
    return alarms.map<Widget>(
      (ScheduleAlarm alarm) {
        return Text(alarm.hashCode.toString());
      },
    ).toList();
  }
}
