import 'package:notifier/firebase.dart';
import 'package:notifier/ui/all.dart';

class UserProvider with ChangeNotifier {
  User _user;
  User get user => _user;
  set user(User user) {
    _user = user;

    notifyListeners();
  }

  String get uid {
    return user?.uid;
  }
}
