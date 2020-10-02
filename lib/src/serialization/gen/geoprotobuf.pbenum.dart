///
//  Generated code. Do not modify.
//  source: geoprotobuf.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Geometry_Type extends $pb.ProtobufEnum {
  static const Geometry_Type POINT = Geometry_Type._(0, 'POINT');
  static const Geometry_Type LINESTRING = Geometry_Type._(1, 'LINESTRING');
  static const Geometry_Type POLYGON = Geometry_Type._(2, 'POLYGON');
  static const Geometry_Type MULTIPOINT = Geometry_Type._(3, 'MULTIPOINT');
  static const Geometry_Type MULTILINESTRING = Geometry_Type._(4, 'MULTILINESTRING');
  static const Geometry_Type MULTIPOLYGON = Geometry_Type._(5, 'MULTIPOLYGON');
  static const Geometry_Type LINE = Geometry_Type._(6, 'LINE');
  static const Geometry_Type TRIANGLE = Geometry_Type._(7, 'TRIANGLE');
  static const Geometry_Type LINEARRING = Geometry_Type._(8, 'LINEARRING');
  static const Geometry_Type GEOMETRYCOLLECTION = Geometry_Type._(9, 'GEOMETRYCOLLECTION');

  static const $core.List<Geometry_Type> values = <Geometry_Type> [
    POINT,
    LINESTRING,
    POLYGON,
    MULTIPOINT,
    MULTILINESTRING,
    MULTIPOLYGON,
    LINE,
    TRIANGLE,
    LINEARRING,
    GEOMETRYCOLLECTION,
  ];

  static final $core.Map<$core.int, Geometry_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Geometry_Type valueOf($core.int value) => _byValue[value];

  const Geometry_Type._($core.int v, $core.String n) : super(v, n);
}

