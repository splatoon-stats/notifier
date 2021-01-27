library values;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'values.g.dart';

abstract class KeyedName implements Built<KeyedName, KeyedNameBuilder> {
  factory KeyedName([void Function(KeyedNameBuilder) updates]) = _$KeyedName;

  KeyedName._();

  @BuiltValueField(wireName: 'key')
  String get key;
  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(KeyedName.serializer, this)
        as Map<String, dynamic>;
  }

  static KeyedName fromJson(Map<dynamic, dynamic> json) {
    return serializers.deserializeWith(KeyedName.serializer, json);
  }

  static Serializer<KeyedName> get serializer => _$keyedNameSerializer;
}

abstract class Schedule implements Built<Schedule, ScheduleBuilder> {
  factory Schedule([void Function(ScheduleBuilder) updates]) = _$Schedule;

  Schedule._();

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'rule')
  KeyedName get rule;
  @BuiltValueField(wireName: 'game_mode')
  KeyedName get gameMode;
  @BuiltValueField(wireName: 'start_time')
  int get startTimeRaw;
  @BuiltValueField(wireName: 'end_time')
  int get endTimeRaw;
  @BuiltValueField(wireName: 'stage_a')
  Stage get stageA;
  @BuiltValueField(wireName: 'stage_b')
  Stage get stageB;

  DateTime get startTime =>
      DateTime.fromMillisecondsSinceEpoch(startTimeRaw * 1000);
  DateTime get endTime =>
      DateTime.fromMillisecondsSinceEpoch(endTimeRaw * 1000);

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Schedule.serializer, this)
        as Map<String, dynamic>;
  }

  static Schedule fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Schedule.serializer, json);
  }

  static Serializer<Schedule> get serializer => _$scheduleSerializer;
}

abstract class ScheduleAlarm
    implements Built<ScheduleAlarm, ScheduleAlarmBuilder> {
  factory ScheduleAlarm([void Function(ScheduleAlarmBuilder) updates]) =
      _$ScheduleAlarm;

  ScheduleAlarm._();

  @BuiltValueField(wireName: 'key')
  String get key;
  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ScheduleAlarm.serializer, this)
        as Map<String, dynamic>;
  }

  static ScheduleAlarm fromJson(Map<dynamic, dynamic> json) {
    return serializers.deserializeWith(ScheduleAlarm.serializer, json);
  }

  static Serializer<ScheduleAlarm> get serializer => _$scheduleAlarmSerializer;
}

abstract class Stage implements Built<Stage, StageBuilder> {
  factory Stage([void Function(StageBuilder b) updates]) = _$Stage;

  Stage._();

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'image')
  String get image;
  @BuiltValueField(wireName: 'id')
  String get id;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Stage.serializer, this)
        as Map<String, dynamic>;
  }

  static Stage fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Stage.serializer, json);
  }

  static Serializer<Stage> get serializer => _$stageSerializer;
}
