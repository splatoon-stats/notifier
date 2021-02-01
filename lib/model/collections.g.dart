// GENERATED CODE - DO NOT MODIFY BY HAND

part of collections;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Schedules> _$schedulesSerializer = new _$SchedulesSerializer();
Serializer<ScheduleAlarms> _$scheduleAlarmsSerializer =
    new _$ScheduleAlarmsSerializer();

class _$SchedulesSerializer implements StructuredSerializer<Schedules> {
  @override
  final Iterable<Type> types = const [Schedules, _$Schedules];
  @override
  final String wireName = 'Schedules';

  @override
  Iterable<Object> serialize(Serializers serializers, Schedules object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'regular',
      serializers.serialize(object.regular,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Schedule)])),
      'gachi',
      serializers.serialize(object.gachi,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Schedule)])),
      'league',
      serializers.serialize(object.league,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Schedule)])),
    ];

    return result;
  }

  @override
  Schedules deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SchedulesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'regular':
          result.regular.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Schedule)]))
              as BuiltList<Object>);
          break;
        case 'gachi':
          result.gachi.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Schedule)]))
              as BuiltList<Object>);
          break;
        case 'league':
          result.league.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Schedule)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleAlarmsSerializer
    implements StructuredSerializer<ScheduleAlarms> {
  @override
  final Iterable<Type> types = const [ScheduleAlarms, _$ScheduleAlarms];
  @override
  final String wireName = 'ScheduleAlarms';

  @override
  Iterable<Object> serialize(Serializers serializers, ScheduleAlarms object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'alarms',
      serializers.serialize(object.alarms,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(ScheduleAlarm)])),
    ];

    return result;
  }

  @override
  ScheduleAlarms deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleAlarmsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'alarms':
          result.alarms.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ScheduleAlarm)
              ])));
          break;
      }
    }

    return result.build();
  }
}

class _$Schedules extends Schedules {
  @override
  final BuiltList<Schedule> regular;
  @override
  final BuiltList<Schedule> gachi;
  @override
  final BuiltList<Schedule> league;

  factory _$Schedules([void Function(SchedulesBuilder) updates]) =>
      (new SchedulesBuilder()..update(updates)).build();

  _$Schedules._({this.regular, this.gachi, this.league}) : super._() {
    if (regular == null) {
      throw new BuiltValueNullFieldError('Schedules', 'regular');
    }
    if (gachi == null) {
      throw new BuiltValueNullFieldError('Schedules', 'gachi');
    }
    if (league == null) {
      throw new BuiltValueNullFieldError('Schedules', 'league');
    }
  }

  @override
  Schedules rebuild(void Function(SchedulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchedulesBuilder toBuilder() => new SchedulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedules &&
        regular == other.regular &&
        gachi == other.gachi &&
        league == other.league;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, regular.hashCode), gachi.hashCode), league.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Schedules')
          ..add('regular', regular)
          ..add('gachi', gachi)
          ..add('league', league))
        .toString();
  }
}

class SchedulesBuilder implements Builder<Schedules, SchedulesBuilder> {
  _$Schedules _$v;

  ListBuilder<Schedule> _regular;
  ListBuilder<Schedule> get regular =>
      _$this._regular ??= new ListBuilder<Schedule>();
  set regular(ListBuilder<Schedule> regular) => _$this._regular = regular;

  ListBuilder<Schedule> _gachi;
  ListBuilder<Schedule> get gachi =>
      _$this._gachi ??= new ListBuilder<Schedule>();
  set gachi(ListBuilder<Schedule> gachi) => _$this._gachi = gachi;

  ListBuilder<Schedule> _league;
  ListBuilder<Schedule> get league =>
      _$this._league ??= new ListBuilder<Schedule>();
  set league(ListBuilder<Schedule> league) => _$this._league = league;

  SchedulesBuilder();

  SchedulesBuilder get _$this {
    if (_$v != null) {
      _regular = _$v.regular?.toBuilder();
      _gachi = _$v.gachi?.toBuilder();
      _league = _$v.league?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Schedules other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Schedules;
  }

  @override
  void update(void Function(SchedulesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Schedules build() {
    _$Schedules _$result;
    try {
      _$result = _$v ??
          new _$Schedules._(
              regular: regular.build(),
              gachi: gachi.build(),
              league: league.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'regular';
        regular.build();
        _$failedField = 'gachi';
        gachi.build();
        _$failedField = 'league';
        league.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Schedules', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ScheduleAlarms extends ScheduleAlarms {
  @override
  final BuiltMap<String, ScheduleAlarm> alarms;

  factory _$ScheduleAlarms([void Function(ScheduleAlarmsBuilder) updates]) =>
      (new ScheduleAlarmsBuilder()..update(updates)).build();

  _$ScheduleAlarms._({this.alarms}) : super._() {
    if (alarms == null) {
      throw new BuiltValueNullFieldError('ScheduleAlarms', 'alarms');
    }
  }

  @override
  ScheduleAlarms rebuild(void Function(ScheduleAlarmsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleAlarmsBuilder toBuilder() =>
      new ScheduleAlarmsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleAlarms && alarms == other.alarms;
  }

  @override
  int get hashCode {
    return $jf($jc(0, alarms.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ScheduleAlarms')
          ..add('alarms', alarms))
        .toString();
  }
}

class ScheduleAlarmsBuilder
    implements Builder<ScheduleAlarms, ScheduleAlarmsBuilder> {
  _$ScheduleAlarms _$v;

  MapBuilder<String, ScheduleAlarm> _alarms;
  MapBuilder<String, ScheduleAlarm> get alarms =>
      _$this._alarms ??= new MapBuilder<String, ScheduleAlarm>();
  set alarms(MapBuilder<String, ScheduleAlarm> alarms) =>
      _$this._alarms = alarms;

  ScheduleAlarmsBuilder();

  ScheduleAlarmsBuilder get _$this {
    if (_$v != null) {
      _alarms = _$v.alarms?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleAlarms other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ScheduleAlarms;
  }

  @override
  void update(void Function(ScheduleAlarmsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ScheduleAlarms build() {
    _$ScheduleAlarms _$result;
    try {
      _$result = _$v ?? new _$ScheduleAlarms._(alarms: alarms.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'alarms';
        alarms.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ScheduleAlarms', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
