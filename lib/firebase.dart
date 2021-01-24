import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notifier/config.dart';

export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_database/firebase_database.dart';

FirebaseDatabase get database {
  return Config.DEV_FIREBASE_DATABASE_URL == null
      ? FirebaseDatabase.instance
      : FirebaseDatabase(
          databaseURL: Config.DEV_FIREBASE_DATABASE_URL,
        );
}

FirebaseAuth get auth {
  return FirebaseAuth.instance;
}

FirebaseMessaging get messaging {
  return FirebaseMessaging.instance;
}
