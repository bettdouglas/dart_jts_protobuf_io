import 'package:jts_dart_protobuf/src/serialization/gen/geoprotobuf.pb.dart' as pb;
import 'package:dart_jts/dart_jts.dart' as jts;
import 'serilization_handler.dart';

class JTSDeserializationHandler extends DeserializationHandler {
  jts.GeometryFactory geometryFactory;

  JTSDeserializationHandler() {
    geometryFactory = jts.GeometryFactory.defaultPrecision();
  }

  @override
  jts.Geometry deserialize(pb.Geometry geometry) {
    switch (geometry.type) {
      case pb.Geometry_Type.POINT:
        return deserializePoint(geometry);
      case pb.Geometry_Type.LINESTRING:
      case pb.Geometry_Type.LINE:
        return deserializeLineString(geometry);
      case pb.Geometry_Type.LINEARRING:
        return deserializeLinearRing(geometry);
      case pb.Geometry_Type.POLYGON:
        return deserializePolygon(geometry);
        break;
      case pb.Geometry_Type.MULTIPOINT:
        return deserializeMultiPoint(geometry);
      case pb.Geometry_Type.MULTILINESTRING:
        return deserializeMultiLineString(geometry);
      case pb.Geometry_Type.MULTIPOLYGON:
        return deserializeMultiPolygon(geometry);
      case pb.Geometry_Type.GEOMETRYCOLLECTION:
        return deserializeGeometryCollection(geometry);
      default:
        throw 'Unsupported Geometric type[${geometry.type}] for Protobuf deserialization';
    }
  }

  jts.Point deserializePoint(pb.Geometry geometry) {
    final coordinate = createJTSCoordinate(geometry.coordinates.first);
    return geometryFactory.createPoint(coordinate);
  }

  jts.LineString deserializeLineString(pb.Geometry geometry) {
    final coordinates = geometry.coordinates.map(createJTSCoordinate).toList();
    return geometryFactory.createLineString(coordinates);
  }

  jts.LinearRing deserializeLinearRing(pb.Geometry geometry) {
    final coordinates = geometry.coordinates.map(createJTSCoordinate).toList();
    return geometryFactory.createLinearRing(coordinates);
  }

  jts.Polygon deserializePolygon(pb.Geometry geometry) {
    if (geometry.geometries.length == 1) {
      final exteriorLineString = geometry.geometries.first;
      final coordinates =
          exteriorLineString.coordinates.map(createJTSCoordinate).toList();
      return geometryFactory.createPolygonFromCoords(coordinates);
    } else {
      final exteriorLineString = geometry.geometries.first;
      final exCoordinates =
          exteriorLineString.coordinates.map(createJTSCoordinate).toList();
      final exteriorLR = geometryFactory.createLinearRing(exCoordinates);

      final interiorLSs = geometry.geometries[1].geometries;
      final jtsInteriorLRs = interiorLSs
          .map((e) => geometryFactory.createLinearRing(
              e.coordinates.map(createJTSCoordinate).toList()))
          .toList();
      return geometryFactory.createPolygon(exteriorLR, jtsInteriorLRs);
    }
  }

  jts.MultiPoint deserializeMultiPoint(pb.Geometry geometry) {
    final jtsPoints =
        geometry.geometries.map((e) => deserializePoint(e)).toList();
    return geometryFactory.createMultiPoint(jtsPoints);
  }

  jts.MultiLineString deserializeMultiLineString(pb.Geometry geometry) {
    final jtsLineStrings =
        geometry.geometries.map(deserializeLineString).toList();
    return geometryFactory.createMultiLineString(jtsLineStrings);
  }

  jts.MultiPolygon deserializeMultiPolygon(pb.Geometry geometry) {
    final jtsPolygons = geometry.geometries.map(deserializePolygon).toList();
    return geometryFactory.createMultiPolygon(jtsPolygons);
  }

  jts.GeometryCollection deserializeGeometryCollection(pb.Geometry geometry) {
    final geometries = geometry.geometries.map(deserializeGeometry).toList();
    return geometryFactory.createGeometryCollection(geometries);
  }

  jts.Geometry deserializeGeometry(pb.Geometry geometry) {
    switch (geometry.type) {
      case pb.Geometry_Type.POINT:
        return deserializePoint(geometry);
      case pb.Geometry_Type.LINESTRING:
      case pb.Geometry_Type.LINE:
        return deserializeLineString(geometry);
      case pb.Geometry_Type.LINEARRING:
        return deserializeLinearRing(geometry);
      case pb.Geometry_Type.POLYGON:
        return deserializePolygon(geometry);
        break;
      case pb.Geometry_Type.MULTIPOINT:
        return deserializeMultiPoint(geometry);
      case pb.Geometry_Type.MULTILINESTRING:
        return deserializeMultiLineString(geometry);
      case pb.Geometry_Type.MULTIPOLYGON:
        return deserializeMultiPolygon(geometry);
      case pb.Geometry_Type.GEOMETRYCOLLECTION:
        return deserializeGeometryCollection(geometry);
      default:
        print('Unsupported Geometric type for Protobuf deserialization');
        return null;
    }
  }

  jts.Coordinate createJTSCoordinate(pb.Coordinate coordinate) {
    return jts.Coordinate(coordinate.x, coordinate.y);
  }
}
