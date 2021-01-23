library collections;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';
import 'values.dart';

part 'collections.g.dart';

abstract class Schedules implements Built<Schedules, SchedulesBuilder> {
  factory Schedules([void Function(SchedulesBuilder) updates]) = _$Schedules;

  Schedules._();

  BuiltList<Schedule> get regular;
  BuiltList<Schedule> get gachi;
  BuiltList<Schedule> get league;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Schedules.serializer, this) as Map<String, dynamic>;
  }

  static Schedules fromJson(Map<dynamic, dynamic> json) {
    return serializers.deserializeWith(Schedules.serializer, json);
  }

  static Serializer<Schedules> get serializer => _$schedulesSerializer;
}
