import 'package:notifier/firebase.dart';
import 'package:notifier/ui/all.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) => context.S.appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  static const List<Color> _tabColors = <Color>[
    AppColors.regularBattle,
    AppColors.rankedBattle,
    AppColors.leagueBattle,
  ];

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.S.appName),
      ),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 16.0)),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabBarController,
              children: <Widget>[
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: context.S.stages,
          icon: const Icon(FontAwesomeIcons.clock),
        ),
        BottomNavigationBarItem(
          label: context.S.leagueBattle,
          icon: const Icon(FontAwesomeIcons.listOl),
        ),
      ],
    );
  }

  AnimatedBuilder _buildTabBar() {
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
