import 'package:firebase_database/firebase_database.dart';
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
