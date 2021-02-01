import 'package:flutter/rendering.dart';

const EdgeInsets scrollableBodyPadding =
    EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0);

const TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold);

const int KNOWN_STAGES = 23;

const Duration connectionTimeout = Duration(seconds: 5);

List<int> get stageIds {
  return List<int>.generate(KNOWN_STAGES, (int i) => i);
}
