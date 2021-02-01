import 'package:notifier/ui/all.dart';

class StageWidget extends StatelessWidget {
  const StageWidget({
    this.stageId,
    this.showName = true,
  });

  final int stageId;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    final String stageName = translateStageName(stageId);

    final Stack widget = Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        StageImage('/images/stage/$stageId.png'),
        if (showName)
          Row(
            children: <Widget>[
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  child: Center(child: Text(stageName)),
                ),
              ),
            ],
          ),
      ],
    );

    if (showName) {
      return widget;
    }

    return Tooltip(
      message: stageName,
      child: widget,
    );
  }
}
