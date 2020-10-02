import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:jts_dart_protobuf/src/serialization/geometry_wkt/geometry_wkt.pb.dart';

class GeometryWKTSerializer {
  
  static GeometryWKT mapToRPC(jts.Geometry geometry) {
    switch (geometry.getGeometryType().toUpperCase()) {
      case 'POINT':
        return GeometryWKT()..type = GeometryWKT_Type.POINT
          ..srid = geometry.SRID
          ..wkt = geometry.toText();
        break;
      case 'MULTIPOINT':
        return GeometryWKT()..type = GeometryWKT_Type.MULTIPOINT
          ..srid = geometry.SRID
          ..wkt = geometry.toText();
        break;
      case 'LINESTRING':
        return GeometryWKT()..type = GeometryWKT_Type.LINESTRING
          ..srid = geometry.SRID
          ..wkt = geometry.toText();
        break;
      case 'MULTILINESTRING':
        return GeometryWKT()..type = GeometryWKT_Type.MULTILINESTRING
          ..srid = geometry.SRID
          ..wkt = geometry.toText();
        break;
      case 'POLYGON':
        return GeometryWKT()..type = GeometryWKT_Type.POLYGON
          ..srid = geometry.SRID
          ..wkt = geometry.toText();
        break;
      case 'MULTIPOLYGON':
        return GeometryWKT()..type = GeometryWKT_Type.MULTIPOLYGON
          ..srid = geometry.SRID
          ..wkt = geometry.toText();
        break;
      case '':
        return GeometryWKT()..type = GeometryWKT_Type.POINT
          ..srid = geometry.SRID
          ..wkt = geometry.toText();
        break;
      default:
        throw '${geometry.getGeometryType()} mapper not defined';
    }
  }
}