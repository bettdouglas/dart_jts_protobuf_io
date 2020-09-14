///
//  Generated code. Do not modify.
//  source: geoprotobuf.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'geoprotobuf.pbenum.dart';

export 'geoprotobuf.pbenum.dart';

class Coordinate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Coordinate', createEmptyInstance: create)
    ..a<$core.double>(1, 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, 'y', $pb.PbFieldType.OD)
    ..a<$core.double>(3, 'z', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Coordinate._() : super();
  factory Coordinate() => create();
  factory Coordinate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coordinate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Coordinate clone() => Coordinate()..mergeFromMessage(this);
  Coordinate copyWith(void Function(Coordinate) updates) => super.copyWith((message) => updates(message as Coordinate));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Coordinate create() => Coordinate._();
  Coordinate createEmptyInstance() => create();
  static $pb.PbList<Coordinate> createRepeated() => $pb.PbList<Coordinate>();
  @$core.pragma('dart2js:noInline')
  static Coordinate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Coordinate>(create);
  static Coordinate _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get z => $_getN(2);
  @$pb.TagNumber(3)
  set z($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);
}

class Geometry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Geometry', createEmptyInstance: create)
    ..e<Geometry_Type>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: Geometry_Type.POINT, valueOf: Geometry_Type.valueOf, enumValues: Geometry_Type.values)
    ..pc<Coordinate>(2, 'coordinates', $pb.PbFieldType.PM, subBuilder: Coordinate.create)
    ..pc<Geometry>(3, 'geometries', $pb.PbFieldType.PM, subBuilder: Geometry.create)
    ..hasRequiredFields = false
  ;

  Geometry._() : super();
  factory Geometry() => create();
  factory Geometry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Geometry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Geometry clone() => Geometry()..mergeFromMessage(this);
  Geometry copyWith(void Function(Geometry) updates) => super.copyWith((message) => updates(message as Geometry));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Geometry create() => Geometry._();
  Geometry createEmptyInstance() => create();
  static $pb.PbList<Geometry> createRepeated() => $pb.PbList<Geometry>();
  @$core.pragma('dart2js:noInline')
  static Geometry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Geometry>(create);
  static Geometry _defaultInstance;

  @$pb.TagNumber(1)
  Geometry_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Geometry_Type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Coordinate> get coordinates => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Geometry> get geometries => $_getList(2);
}

