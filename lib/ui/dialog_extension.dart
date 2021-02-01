import 'package:notifier/ui/all.dart';

extension DialogExtension on BuildContext {
  Future<void> showErrorDialog({@required String message}) {
    return showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.error),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(S.toClose),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
