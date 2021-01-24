import 'package:firebase_auth/firebase_auth.dart';
import 'package:notifier/config.dart';
import 'package:notifier/firebase.dart';
import 'package:notifier/ui/all.dart';
import 'package:notifier/util/env_loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Config.env = await loadEnv('assets/.env');

  final Future<UserCredential> signInResult = auth.signInAnonymously();

  Future<void> updateToken(String fcmToken) async {
    final UserCredential credential = await signInResult;
    await database
        .reference()
        .child('fcmTokens/${credential.user.uid}')
        .update(<String, bool>{fcmToken: true});
  }

  messaging.getToken().then(updateToken);
  messaging.onTokenRefresh.listen(updateToken);

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

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> _bottomNavigationController = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.S.appName),
      ),
      body: SchedulesPage(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _bottomNavigationController,
      builder: (BuildContext context, int i, _) => BottomNavigationBar(
        onTap: (int value) => _bottomNavigationController.value = value,
        currentIndex: i,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: context.S.stages,
            icon: const Icon(FontAwesomeIcons.clock),
          ),
          BottomNavigationBarItem(
            label: context.S.alarms,
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
    );
  }
}
