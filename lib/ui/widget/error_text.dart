import 'package:notifier/ui/all.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.data);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
