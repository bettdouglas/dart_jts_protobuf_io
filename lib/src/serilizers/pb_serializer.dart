import 'package:jts_dart_protobuf/src/serialization/gen/geoprotobuf.pb.dart' as pb;
import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:jts_dart_protobuf/src/serilizers/serilization_handler.dart';

class JTSSerializationHandler extends SerializationHandler {
  @override
  pb.Geometry serialize(dynamic geometry) {
    if (geometry is jts.Point) {
      return serializePoint(geometry);
    } else if (geometry is jts.LinearRing) {
      return serializeLinearRing(geometry);
    } else if (geometry is jts.LineString) {
      return serializeLineString(geometry);
    } else if (geometry is jts.Polygon) {
      return serializePolygon(geometry);
    } else if (geometry is jts.MultiPoint) {
      return serializeMultiPoint(geometry);
    } else if (geometry is jts.MultiLineString) {
      return serializeMultiLineString(geometry);
    } else if (geometry is jts.MultiPolygon) {
      return serializeMultiPolygon(geometry);
    } else if (geometry is jts.Triangle) {
      return serializeTriangle(geometry);
    } else if (geometry is jts.GeometryCollection) {
      return serializeGeometryCollection(geometry);
    } else {
      throw 'Unsupported Geometric type[${geometry.runtimeType}] for Protobuf Serialization';
    }
  }

  pb.Geometry serializePoint(jts.Point point) {
    if (point.getCoordinates().isEmpty) {
      throw 'No Coordinate data available';
    } else {
      return pb.Geometry()
        ..type = pb.Geometry_Type.POINT
        ..coordinates.add(
          pb.Coordinate()
            ..x = point.getX()
            ..y = point.getY()
            ..z = point.getCoordinate().z,
        );
    }
  }

  pb.Geometry serializeLinearRing(jts.LinearRing linearRing) {
    final coordsLength = linearRing.getCoordinates().length;
    if (coordsLength < 2) {
      throw 'Insufficient Coordinates in LinearRing. CoordinatesLength = ${coordsLength}';
    } else {
      return pb.Geometry()
        ..type = pb.Geometry_Type.LINEARRING
        ..coordinates.addAll(linearRing.getCoordinates().map(createCoordinate));
    }
  }

  pb.Geometry serializeLineString(jts.LineString linearRing) {
    final coordsLength = linearRing.getCoordinates().length;
    if (coordsLength < 2) {
      throw 'Insufficient Coordinates in LinearRing. CoordinatesLength = ${coordsLength}';
    } else {
      return pb.Geometry()
        ..type = pb.Geometry_Type.LINESTRING
        ..coordinates.addAll(linearRing.getCoordinates().map(createCoordinate));
    }
  }

  // pb.Geometry serializeLine(jts.LineSegment line) {

  // }

  pb.Geometry serializePolygon(jts.Polygon polygon) {
    final externalLS = polygon.getExteriorRing();
    final numOfRings = polygon.getNumInteriorRing();

    var geoPolygon = pb.Geometry()..type = pb.Geometry_Type.POLYGON;

    final externalGeo = pb.Geometry()
      ..coordinates.addAll(externalLS.getCoordinates().map(createCoordinate));
    geoPolygon.geometries.add(externalGeo);

    if (numOfRings > 0) {
      final interiorGeos = pb.Geometry();
      for (var i = 0; i < numOfRings; i++) {
        final interiorLS = polygon.getInteriorRingN(i);
        final iGeo = pb.Geometry()
          ..coordinates
              .addAll(interiorLS.getCoordinates().map(createCoordinate));
        interiorGeos.geometries.add(iGeo);
      }
      geoPolygon.geometries.add(interiorGeos);
    }
    return geoPolygon;
  }

  pb.Geometry serializeMultiPoint(jts.MultiPoint multiPoint) {
    return pb.Geometry()
      ..type = pb.Geometry_Type.MULTIPOINT
      ..geometries.addAll(
        List.generate(
          multiPoint.getNumGeometries(),
          (idx) => serializePoint(
            multiPoint.getGeometryN(idx),
          ),
        ),
      );
  }

  pb.Geometry serializeMultiLineString(jts.MultiLineString lineString) {
    return pb.Geometry()
      ..type = pb.Geometry_Type.MULTILINESTRING
      ..geometries.addAll(
        List.generate(
          lineString.getNumGeometries(),
          (idx) => serializeLineString(
            lineString.getGeometryN(idx),
          ),
        ),
      );
  }

  pb.Geometry serializeMultiPolygon(jts.MultiPolygon multiPolygon) {
    return pb.Geometry()
      ..type = pb.Geometry_Type.MULTIPOLYGON
      ..geometries.addAll(
        List.generate(
          multiPolygon.getNumGeometries(),
          (idx) => serializePolygon(
            multiPolygon.getGeometryN(idx),
          ),
        ),
      );
  }

  pb.Geometry serializeTriangle(jts.Triangle triangle) {
    final p0 = triangle.p0;
    final p1 = triangle.p1;
    final p2 = triangle.p2;
    if (p0 == null || p1 == null || p2 == null) {
      throw 'Insufficient Coordinates';
    } else {
      return pb.Geometry()
        ..type = pb.Geometry_Type.TRIANGLE
        ..coordinates.addAll(
          [
            createCoordinate(p0),
            createCoordinate(p1),
            createCoordinate(p2),
          ],
        );
    }
  }

  pb.Geometry serializeGeometryCollection(jts.GeometryCollection collection) {
    return pb.Geometry()
      ..type = pb.Geometry_Type.GEOMETRYCOLLECTION
      ..geometries.addAll(
        List.generate(
          collection.getNumGeometries(),
          (idx) {
            final geom = collection.getGeometryN(idx);
            if (geom is jts.Point) {
              return serializePoint(geom);
            } else if (geom is jts.LinearRing) {
              return serializeLinearRing(geom);
            } else if (geom is jts.LineString) {
              return serializeLineString(geom);
            } else if (geom is jts.Polygon) {
              return serializePolygon(geom);
            } else if (geom is jts.MultiPoint) {
              return serializeMultiPoint(geom);
            } else if (geom is jts.MultiLineString) {
              return serializeMultiLineString(geom);
            } else if (geom is jts.MultiPolygon) {
              return serializeMultiPolygon(geom);
            } else {
              throw 'Unsupported Geometric type[${geom.runtimeType}] for Protobuf Serialization';
            }
          },
        ),
      );
  }

  pb.Coordinate createCoordinate(jts.Coordinate coordinate) {
    return pb.Coordinate()
      ..x = coordinate.x
      ..y = coordinate.y
      ..z = coordinate.z;
  }
}
