library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'collections.dart';
import 'values.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  // values.dart
  KeyedName,
  Schedule,
  Stage,

  // collections.dart
  Schedules,
])
final Serializers _serializers = _$_serializers;

Serializers get serializers {
  final SerializersBuilder builder = _serializers.toBuilder();

  builder.addPlugin(StandardJsonPlugin());

  return builder.build();
}
