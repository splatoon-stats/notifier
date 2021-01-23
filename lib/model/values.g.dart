// GENERATED CODE - DO NOT MODIFY BY HAND

part of values;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KeyedName> _$keyedNameSerializer = new _$KeyedNameSerializer();
Serializer<Schedule> _$scheduleSerializer = new _$ScheduleSerializer();
Serializer<Stage> _$stageSerializer = new _$StageSerializer();

class _$KeyedNameSerializer implements StructuredSerializer<KeyedName> {
  @override
  final Iterable<Type> types = const [KeyedName, _$KeyedName];
  @override
  final String wireName = 'KeyedName';

  @override
  Iterable<Object> serialize(Serializers serializers, KeyedName object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  KeyedName deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KeyedNameBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleSerializer implements StructuredSerializer<Schedule> {
  @override
  final Iterable<Type> types = const [Schedule, _$Schedule];
  @override
  final String wireName = 'Schedule';

  @override
  Iterable<Object> serialize(Serializers serializers, Schedule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'rule',
      serializers.serialize(object.rule,
          specifiedType: const FullType(KeyedName)),
      'game_mode',
      serializers.serialize(object.gameMode,
          specifiedType: const FullType(KeyedName)),
      'start_time',
      serializers.serialize(object.startTimeRaw,
          specifiedType: const FullType(int)),
      'end_time',
      serializers.serialize(object.endTimeRaw,
          specifiedType: const FullType(int)),
      'stage_a',
      serializers.serialize(object.stageA,
          specifiedType: const FullType(Stage)),
      'stage_b',
      serializers.serialize(object.stageB,
          specifiedType: const FullType(Stage)),
    ];

    return result;
  }

  @override
  Schedule deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rule':
          result.rule.replace(serializers.deserialize(value,
              specifiedType: const FullType(KeyedName)) as KeyedName);
          break;
        case 'game_mode':
          result.gameMode.replace(serializers.deserialize(value,
              specifiedType: const FullType(KeyedName)) as KeyedName);
          break;
        case 'start_time':
          result.startTimeRaw = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'end_time':
          result.endTimeRaw = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'stage_a':
          result.stageA.replace(serializers.deserialize(value,
              specifiedType: const FullType(Stage)) as Stage);
          break;
        case 'stage_b':
          result.stageB.replace(serializers.deserialize(value,
              specifiedType: const FullType(Stage)) as Stage);
          break;
      }
    }

    return result.build();
  }
}

class _$StageSerializer implements StructuredSerializer<Stage> {
  @override
  final Iterable<Type> types = const [Stage, _$Stage];
  @override
  final String wireName = 'Stage';

  @override
  Iterable<Object> serialize(Serializers serializers, Stage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Stage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$KeyedName extends KeyedName {
  @override
  final String key;
  @override
  final String name;

  factory _$KeyedName([void Function(KeyedNameBuilder) updates]) =>
      (new KeyedNameBuilder()..update(updates)).build();

  _$KeyedName._({this.key, this.name}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('KeyedName', 'key');
    }
  }

  @override
  KeyedName rebuild(void Function(KeyedNameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KeyedNameBuilder toBuilder() => new KeyedNameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KeyedName && key == other.key && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KeyedName')
          ..add('key', key)
          ..add('name', name))
        .toString();
  }
}

class KeyedNameBuilder implements Builder<KeyedName, KeyedNameBuilder> {
  _$KeyedName _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  KeyedNameBuilder();

  KeyedNameBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KeyedName other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$KeyedName;
  }

  @override
  void update(void Function(KeyedNameBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KeyedName build() {
    final _$result = _$v ?? new _$KeyedName._(key: key, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$Schedule extends Schedule {
  @override
  final int id;
  @override
  final KeyedName rule;
  @override
  final KeyedName gameMode;
  @override
  final int startTimeRaw;
  @override
  final int endTimeRaw;
  @override
  final Stage stageA;
  @override
  final Stage stageB;

  factory _$Schedule([void Function(ScheduleBuilder) updates]) =>
      (new ScheduleBuilder()..update(updates)).build();

  _$Schedule._(
      {this.id,
      this.rule,
      this.gameMode,
      this.startTimeRaw,
      this.endTimeRaw,
      this.stageA,
      this.stageB})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Schedule', 'id');
    }
    if (rule == null) {
      throw new BuiltValueNullFieldError('Schedule', 'rule');
    }
    if (gameMode == null) {
      throw new BuiltValueNullFieldError('Schedule', 'gameMode');
    }
    if (startTimeRaw == null) {
      throw new BuiltValueNullFieldError('Schedule', 'startTimeRaw');
    }
    if (endTimeRaw == null) {
      throw new BuiltValueNullFieldError('Schedule', 'endTimeRaw');
    }
    if (stageA == null) {
      throw new BuiltValueNullFieldError('Schedule', 'stageA');
    }
    if (stageB == null) {
      throw new BuiltValueNullFieldError('Schedule', 'stageB');
    }
  }

  @override
  Schedule rebuild(void Function(ScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleBuilder toBuilder() => new ScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedule &&
        id == other.id &&
        rule == other.rule &&
        gameMode == other.gameMode &&
        startTimeRaw == other.startTimeRaw &&
        endTimeRaw == other.endTimeRaw &&
        stageA == other.stageA &&
        stageB == other.stageB;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), rule.hashCode),
                        gameMode.hashCode),
                    startTimeRaw.hashCode),
                endTimeRaw.hashCode),
            stageA.hashCode),
        stageB.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Schedule')
          ..add('id', id)
          ..add('rule', rule)
          ..add('gameMode', gameMode)
          ..add('startTimeRaw', startTimeRaw)
          ..add('endTimeRaw', endTimeRaw)
          ..add('stageA', stageA)
          ..add('stageB', stageB))
        .toString();
  }
}

class ScheduleBuilder implements Builder<Schedule, ScheduleBuilder> {
  _$Schedule _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  KeyedNameBuilder _rule;
  KeyedNameBuilder get rule => _$this._rule ??= new KeyedNameBuilder();
  set rule(KeyedNameBuilder rule) => _$this._rule = rule;

  KeyedNameBuilder _gameMode;
  KeyedNameBuilder get gameMode => _$this._gameMode ??= new KeyedNameBuilder();
  set gameMode(KeyedNameBuilder gameMode) => _$this._gameMode = gameMode;

  int _startTimeRaw;
  int get startTimeRaw => _$this._startTimeRaw;
  set startTimeRaw(int startTimeRaw) => _$this._startTimeRaw = startTimeRaw;

  int _endTimeRaw;
  int get endTimeRaw => _$this._endTimeRaw;
  set endTimeRaw(int endTimeRaw) => _$this._endTimeRaw = endTimeRaw;

  StageBuilder _stageA;
  StageBuilder get stageA => _$this._stageA ??= new StageBuilder();
  set stageA(StageBuilder stageA) => _$this._stageA = stageA;

  StageBuilder _stageB;
  StageBuilder get stageB => _$this._stageB ??= new StageBuilder();
  set stageB(StageBuilder stageB) => _$this._stageB = stageB;

  ScheduleBuilder();

  ScheduleBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _rule = _$v.rule?.toBuilder();
      _gameMode = _$v.gameMode?.toBuilder();
      _startTimeRaw = _$v.startTimeRaw;
      _endTimeRaw = _$v.endTimeRaw;
      _stageA = _$v.stageA?.toBuilder();
      _stageB = _$v.stageB?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Schedule other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Schedule;
  }

  @override
  void update(void Function(ScheduleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Schedule build() {
    _$Schedule _$result;
    try {
      _$result = _$v ??
          new _$Schedule._(
              id: id,
              rule: rule.build(),
              gameMode: gameMode.build(),
              startTimeRaw: startTimeRaw,
              endTimeRaw: endTimeRaw,
              stageA: stageA.build(),
              stageB: stageB.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'rule';
        rule.build();
        _$failedField = 'gameMode';
        gameMode.build();

        _$failedField = 'stageA';
        stageA.build();
        _$failedField = 'stageB';
        stageB.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Schedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Stage extends Stage {
  @override
  final String name;
  @override
  final String image;
  @override
  final String id;

  factory _$Stage([void Function(StageBuilder) updates]) =>
      (new StageBuilder()..update(updates)).build();

  _$Stage._({this.name, this.image, this.id}) : super._() {
    if (image == null) {
      throw new BuiltValueNullFieldError('Stage', 'image');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Stage', 'id');
    }
  }

  @override
  Stage rebuild(void Function(StageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StageBuilder toBuilder() => new StageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stage &&
        name == other.name &&
        image == other.image &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), image.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Stage')
          ..add('name', name)
          ..add('image', image)
          ..add('id', id))
        .toString();
  }
}

class StageBuilder implements Builder<Stage, StageBuilder> {
  _$Stage _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  StageBuilder();

  StageBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _image = _$v.image;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Stage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Stage;
  }

  @override
  void update(void Function(StageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Stage build() {
    final _$result = _$v ?? new _$Stage._(name: name, image: image, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
