import 'package:dart_jts/dart_jts.dart';

class GeometricWithCentroid {
  Point _center;

  GeometricWithCentroid(Geometry geometry) {
    _center = geometry.getCentroid();
  }

  Point get center => _center;
}

class Airport extends GeometricWithCentroid {
  final int gid, id, fkRegion;
  final double elevation;
  final String name, use;
  final Point location;

  Airport(this.gid, this.id, this.fkRegion, this.elevation, this.name, this.use,
      this.location) : super(location);
}

class Lake extends GeometricWithCentroid {
  final int gid;
  final String name;
  final Polygon geometry;

  Lake(this.gid, this.name, this.geometry) : super(geometry);
}

class River extends GeometricWithCentroid {
  final int gid;
  final String codec, name, code;
  final LineString geometry;

  River(this.gid, this.codec, this.name, this.code, this.geometry) : super(geometry);
}

class BuiltUps extends GeometricWithCentroid {
  final int gid, category;
  final String name, code;
  final Polygon geometry;

  BuiltUps(this.gid, this.category, this.name, this.code, this.geometry) : super(geometry);
}

class Region extends GeometricWithCentroid {
  final int gid;
  final String name, type;
  final MultiPolygon geometry;

  Region(this.gid, this.name, this.type, this.geometry) : super(geometry);
}
