///
//  Generated code. Do not modify.
//  source: alaska.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class GeometryWKT_Type extends $pb.ProtobufEnum {
  static const GeometryWKT_Type POINT = GeometryWKT_Type._(0, 'POINT');
  static const GeometryWKT_Type LINESTRING = GeometryWKT_Type._(1, 'LINESTRING');
  static const GeometryWKT_Type POLYGON = GeometryWKT_Type._(2, 'POLYGON');
  static const GeometryWKT_Type MULTIPOINT = GeometryWKT_Type._(3, 'MULTIPOINT');
  static const GeometryWKT_Type MULTILINESTRING = GeometryWKT_Type._(4, 'MULTILINESTRING');
  static const GeometryWKT_Type MULTIPOLYGON = GeometryWKT_Type._(5, 'MULTIPOLYGON');
  static const GeometryWKT_Type LINE = GeometryWKT_Type._(6, 'LINE');
  static const GeometryWKT_Type TRIANGLE = GeometryWKT_Type._(7, 'TRIANGLE');
  static const GeometryWKT_Type LINEARRING = GeometryWKT_Type._(8, 'LINEARRING');
  static const GeometryWKT_Type GEOMETRYCOLLECTION = GeometryWKT_Type._(9, 'GEOMETRYCOLLECTION');

  static const $core.List<GeometryWKT_Type> values = <GeometryWKT_Type> [
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

  static final $core.Map<$core.int, GeometryWKT_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GeometryWKT_Type valueOf($core.int value) => _byValue[value];

  const GeometryWKT_Type._($core.int v, $core.String n) : super(v, n);
}

