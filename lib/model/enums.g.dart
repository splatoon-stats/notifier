// GENERATED CODE - DO NOT MODIFY BY HAND

part of enums;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GameMode _$regular = const GameMode._('regular');
const GameMode _$gachi = const GameMode._('gachi');
const GameMode _$league = const GameMode._('league');

GameMode _$gameModeValueOf(String name) {
  switch (name) {
    case 'regular':
      return _$regular;
    case 'gachi':
      return _$gachi;
    case 'league':
      return _$league;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GameMode> _$gameModeValues =
    new BuiltSet<GameMode>(const <GameMode>[
  _$regular,
  _$gachi,
  _$league,
]);

const GameRule _$splatZones = const GameRule._('splatZones');
const GameRule _$towerControl = const GameRule._('towerControl');
const GameRule _$rainmaker = const GameRule._('rainmaker');
const GameRule _$clamBlitz = const GameRule._('clamBlitz');

GameRule _$gameRuleValueOf(String name) {
  switch (name) {
    case 'splatZones':
      return _$splatZones;
    case 'towerControl':
      return _$towerControl;
    case 'rainmaker':
      return _$rainmaker;
    case 'clamBlitz':
      return _$clamBlitz;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GameRule> _$gameRuleValues =
    new BuiltSet<GameRule>(const <GameRule>[
  _$splatZones,
  _$towerControl,
  _$rainmaker,
  _$clamBlitz,
]);

Serializer<GameMode> _$gameModeSerializer = new _$GameModeSerializer();
Serializer<GameRule> _$gameRuleSerializer = new _$GameRuleSerializer();

class _$GameModeSerializer implements PrimitiveSerializer<GameMode> {
  @override
  final Iterable<Type> types = const <Type>[GameMode];
  @override
  final String wireName = 'GameMode';

  @override
  Object serialize(Serializers serializers, GameMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GameMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GameMode.valueOf(serialized as String);
}

class _$GameRuleSerializer implements PrimitiveSerializer<GameRule> {
  @override
  final Iterable<Type> types = const <Type>[GameRule];
  @override
  final String wireName = 'GameRule';

  @override
  Object serialize(Serializers serializers, GameRule object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GameRule deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GameRule.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
