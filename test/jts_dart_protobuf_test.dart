import 'package:dart_jts/dart_jts.dart';
import 'package:test/test.dart';
import 'package:jts_dart_protobuf/jts_protobuf_io.dart';

void main() {
  final geometryFactory = GeometryFactory.defaultPrecision();
  final jtsSerializer = JTSSerializationHandler();
  final jtsDeserializer = JTSDeserializationHandler();
  test('JTSModelPointTest', () {
    final coordinate = Coordinate(1, 2);
    final point = geometryFactory.createPoint(coordinate);
    final serializedPoint = jtsSerializer.serialize(point);
    final deserializedPoint =
        jtsDeserializer.deserialize(serializedPoint) as Point;

    expect(point.equals(deserializedPoint), true);
  });

  test('JTSModelLineStringTest', () {
    final lineString = geometryFactory.createLineString(
        [Coordinate(1, 1), Coordinate(0, 0), Coordinate(1, 0)]);
    final serializedLineString = jtsSerializer.serialize(lineString);

    final deserializedLineString =
        jtsDeserializer.deserialize(serializedLineString) as LineString;
    expect(lineString.equals(deserializedLineString), true);
  });

  group('JTSModelPolygonTest', () {
    test('Normal Polygon Without Hole', () {
      final polygon = geometryFactory.createPolygonFromCoords([
        Coordinate(0, 0),
        Coordinate(10, 0),
        Coordinate(0, 10),
        Coordinate(10, 10),
        Coordinate(0, 0)
      ]);
      final serializedPolygon = jtsSerializer.serialize(polygon);
      final deserializedPolygon =
          jtsDeserializer.deserialize(serializedPolygon);

      expect(polygon.equalsExactGeom(deserializedPolygon), true);
    });

    test('Normal Polygon with Hole', () {
      final polygonWithHole = geometryFactory.createPolygon(
        geometryFactory.createLinearRing([
          Coordinate(0, 0),
          Coordinate(10, 0),
          Coordinate(0, 10),
          Coordinate(10, 10),
          Coordinate(0, 0)
        ]),
        [
          geometryFactory.createLinearRing([
            Coordinate(2, 2),
            Coordinate(2, 3),
            Coordinate(3, 3),
            Coordinate(3, 2),
            Coordinate(2, 2)
          ])
        ],
      );

      final serializedPolygon = jtsSerializer.serialize(polygonWithHole);
      final deserializedPolygon =
          jtsDeserializer.deserialize(serializedPolygon);

      expect(polygonWithHole.equalsExactGeom(deserializedPolygon), true);
    });
  });
  test('LinearRing test', () {
    final linearRing = geometryFactory.createLinearRing(
      [
        Coordinate(0, 0),
        Coordinate(1, 0),
        Coordinate(1, 1),
        Coordinate(0, 0),
      ],
    );
    final serializedLinearRing = jtsSerializer.serialize(linearRing);
    final deserializedLinearRing =
        jtsDeserializer.deserialize(serializedLinearRing);

    expect(deserializedLinearRing.equalsExactGeom(linearRing), true);
  });

  test('MultiPoint test', () {
    final multiPoint = geometryFactory.createMultiPoint(
      [
        Coordinate(0, 0),
        Coordinate(1, 0),
        Coordinate(1, 1),
      ].map(geometryFactory.createPoint).toList(),
    );
    final serializedMultiPoint = jtsSerializer.serialize(multiPoint);
    final deserializedMultiPoint =
        jtsDeserializer.deserialize(serializedMultiPoint);

    expect(multiPoint.equalsExactGeom(deserializedMultiPoint), true);
  });

  test('MultiLineString', () {
    final lineString1 = geometryFactory.createLineString(
      [
        Coordinate(0, 0),
        Coordinate(1, 0),
        Coordinate(1, 1),
      ],
    );
    final lineString2 = geometryFactory.createLineString(
      [
        Coordinate(1, 1),
        Coordinate(2, 1),
        Coordinate(2, 2),
      ],
    );

    final multiLineString =
        geometryFactory.createMultiLineString([lineString1, lineString2]);

    final serializedMultiLineString = jtsSerializer.serialize(multiLineString);
    final deseializedMultiLineString =
        jtsDeserializer.deserialize(serializedMultiLineString);

    expect(multiLineString.equalsExactGeom(deseializedMultiLineString), true);
  });

  test('MultiPolygon ', () {
    final polygonA = geometryFactory.createPolygonFromCoords([
      Coordinate(0, 0),
      Coordinate(10, 0),
      Coordinate(0, 10),
      Coordinate(10, 10),
      Coordinate(0, 0)
    ]);
    final polygonB = geometryFactory.createPolygonFromCoords([
      Coordinate(1, 1),
      Coordinate(10, 0),
      Coordinate(0, 10),
      Coordinate(10, 10),
      Coordinate(1, 1),
    ]);

    final polygonWithHole = geometryFactory.createPolygon(
      geometryFactory.createLinearRing([
        Coordinate(0, 0),
        Coordinate(10, 0),
        Coordinate(0, 10),
        Coordinate(10, 10),
        Coordinate(0, 0)
      ]),
      [
        geometryFactory.createLinearRing([
          Coordinate(2, 2),
          Coordinate(2, 3),
          Coordinate(3, 3),
          Coordinate(3, 2),
          Coordinate(2, 2)
        ])
      ],
    );

    final multiPolygon =
        geometryFactory.createMultiPolygon([polygonA, polygonB]);
    final serializedMultiPolygon = jtsSerializer.serialize(multiPolygon);

    final deserializedMultiPolygon =
        jtsDeserializer.deserialize(serializedMultiPolygon);

    expect(multiPolygon.equalsExactGeom(deserializedMultiPolygon), true);

    final multiPolygonWithHole = geometryFactory
        .createMultiPolygon([polygonA, polygonB, polygonWithHole]);
    final serializedMultiPolygonB =
        jtsSerializer.serialize(multiPolygonWithHole);

    final deserializedMultiPolygonB =
        jtsDeserializer.deserialize(serializedMultiPolygonB);

    expect(
        multiPolygonWithHole.equalsExactGeom(deserializedMultiPolygonB), true);
  });

  test('GeometryCollection', () {
    final polygonA = geometryFactory.createPolygonFromCoords([
      Coordinate(0, 0),
      Coordinate(10, 0),
      Coordinate(0, 10),
      Coordinate(10, 10),
      Coordinate(0, 0)
    ]);
    final polygonB = geometryFactory.createPolygonFromCoords([
      Coordinate(1, 1),
      Coordinate(10, 0),
      Coordinate(0, 10),
      Coordinate(10, 10),
      Coordinate(1, 1),
    ]);

    final polygonWithHole = geometryFactory.createPolygon(
      geometryFactory.createLinearRing([
        Coordinate(0, 0),
        Coordinate(10, 0),
        Coordinate(0, 10),
        Coordinate(10, 10),
        Coordinate(0, 0)
      ]),
      [
        geometryFactory.createLinearRing([
          Coordinate(2, 2),
          Coordinate(2, 3),
          Coordinate(3, 3),
          Coordinate(3, 2),
          Coordinate(2, 2)
        ])
      ],
    );

    final lineString2 = geometryFactory.createLineString(
      [
        Coordinate(1, 1),
        Coordinate(2, 1),
        Coordinate(2, 2),
      ],
    );

    final polygon = geometryFactory.createPolygonFromCoords([
      Coordinate(0, 0),
      Coordinate(10, 0),
      Coordinate(0, 10),
      Coordinate(10, 10),
      Coordinate(0, 0)
    ]);

    final coordinate = Coordinate(1, 2);
    final point = geometryFactory.createPoint(coordinate);

    final geomCollection = geometryFactory.createGeometryCollection([
      polygonA,
      polygonB,
      polygon,
      point,
      lineString2,
      polygonWithHole,
    ]);

    final serializedGeomCollection = jtsSerializer.serialize(geomCollection);
    final deserializedGeomCollection = jtsDeserializer.deserialize(serializedGeomCollection);

    expect(geomCollection.equalsExactGeom(deserializedGeomCollection), true);
  });
}
