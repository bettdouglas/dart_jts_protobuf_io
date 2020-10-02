///
//  Generated code. Do not modify.
//  source: alaska.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'geometry_wkt.pbenum.dart';

export 'geometry_wkt.pbenum.dart';

class GeometryWKT extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GeometryWKT', createEmptyInstance: create)
    ..e<GeometryWKT_Type>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: GeometryWKT_Type.POINT, valueOf: GeometryWKT_Type.valueOf, enumValues: GeometryWKT_Type.values)
    ..aOS(2, 'wkt')
    ..a<$core.int>(3, 'srid', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GeometryWKT._() : super();
  factory GeometryWKT() => create();
  factory GeometryWKT.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeometryWKT.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GeometryWKT clone() => GeometryWKT()..mergeFromMessage(this);
  GeometryWKT copyWith(void Function(GeometryWKT) updates) => super.copyWith((message) => updates(message as GeometryWKT));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeometryWKT create() => GeometryWKT._();
  GeometryWKT createEmptyInstance() => create();
  static $pb.PbList<GeometryWKT> createRepeated() => $pb.PbList<GeometryWKT>();
  @$core.pragma('dart2js:noInline')
  static GeometryWKT getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeometryWKT>(create);
  static GeometryWKT _defaultInstance;

  @$pb.TagNumber(1)
  GeometryWKT_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(GeometryWKT_Type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get wkt => $_getSZ(1);
  @$pb.TagNumber(2)
  set wkt($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWkt() => $_has(1);
  @$pb.TagNumber(2)
  void clearWkt() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get srid => $_getIZ(2);
  @$pb.TagNumber(3)
  set srid($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSrid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSrid() => clearField(3);
}

