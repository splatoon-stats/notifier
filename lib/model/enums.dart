library enums;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enums.g.dart';

class GameMode extends EnumClass {
  const GameMode._(String name) : super(name);

  static const GameMode regular = _$regular;
  static const GameMode gachi = _$gachi;
  static const GameMode league = _$league;

  static BuiltSet<GameMode> get values => _$gameModeValues;
  static GameMode valueOf(String name) => _$gameModeValueOf(name);

  static Serializer<GameMode> get serializer => _$gameModeSerializer;
}

class GameRule extends EnumClass {
  const GameRule._(String name) : super(name);

  static const GameRule splatZones = _$splatZones;
  static const GameRule towerControl = _$towerControl;
  static const GameRule rainmaker = _$rainmaker;
  static const GameRule clamBlitz = _$clamBlitz;

  static BuiltSet<GameRule> get values => _$gameRuleValues;
  static GameRule valueOf(String name) => _$gameRuleValueOf(name);

  static Serializer<GameRule> get serializer => _$gameRuleSerializer;
}
