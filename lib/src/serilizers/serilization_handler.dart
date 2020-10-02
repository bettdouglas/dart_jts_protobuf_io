import 'package:jts_dart_protobuf/src/serialization/gen/geoprotobuf.pb.dart' as pb;
import 'package:dart_jts/dart_jts.dart' as jts;

enum SerializerType {
  PROTOBUF_SERIALIZER_VS,
  PROTOBUF_SERIALIZER_LT,
  AVRO_SERIALIZER_VS,
  AVRO_SERIALIZER_LT,
}

enum DeserializationType {
  PROTOBUF_SERIALIZER_VS,
  GEOJSON,
}

abstract class SerializationHandler {
  SerializerType type;

  pb.Geometry serialize(dynamic geometry);
}

abstract class DeserializationHandler {
  DeserializationType type;

  jts.Geometry deserialize(pb.Geometry geometry);
}

