import 'package:postgres/postgres.dart';
import 'package:dart_jts/dart_jts.dart';
import 'models.dart';

class AskAlaska {
  final PostgreSQLConnection connection;
  final AlaskaDBMapper dbMapper = AlaskaDBMapper();

  AskAlaska(this.connection);

  Future<List<River>> getAlaskaRivers() async {
    var queryString = 'SELECT gid,f_codedesc,nam,f_code,geom FROM rivers';
    var results = await connection.query(queryString);
    return results.map(dbMapper.mapRiverData).toList();
  }

  Future<List<Lake>> getAlaskaLakes() async {
    var queryString = 'SELECT gid,names,geom from lakes';
    var results = await connection.query(queryString);
    return results.map(dbMapper.mapLakeData).toList();
  }

  Future<List<Region>> getAlaskaRegions() async {
    var queryString = 'SELECT id,name_2,type_2,geom from regions';
    var results = await connection.query(queryString);
    return results.map(dbMapper.mapRegionData).toList();
  }

  Future<List<Airport>> getAlaskaAirports({String where}) async {
    var queryString =
        'SELECT gid,id,fk_region,elev::REAL,name,use,geom FROM airports';
    var results = await connection.query(queryString);
    return results.map(dbMapper.mapAirportData).toList();
  }

  Future<List<Airport>> getLakesNearestTo(Airport airport,int count) async {
    var queryString =
        'SELECT gid,id,fk_region,elev::REAL,name,use,geom FROM airports ORDER by @location <> geom ASC LIMIT @limit';
    var results = await connection.query(
      queryString,
      substitutionValues: {
        'location': 'ST_GeomFromText(\'${airport.location.toText()}\',${airport.location.SRID})',
        'limit': count
      },
    );
    return results.map(dbMapper.mapAirportData).toList();
  }

  Future<bool> insertGeom(Geometry geom) async {
    // var ewkt = WKBWriter().write(geom);
    // print(ewkt.toString());
    var statement = 'INSERT INTO geoms(geom) values(@wkb)';
    try {
      await connection
          .execute(statement, substitutionValues: {'wkb': geom.toText()});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class AlaskaDBMapper {
  // final pgParser = PostgisEWKTParser();

  River mapRiverData(PostgreSQLResultRow row) {
    // var riverGeom = pgParser.parseMultiLineString(row[4]);
    return River(row[0], row[1], row[2], row[3], row[4]);
  }

  Lake mapLakeData(PostgreSQLResultRow row) {
    // var lakeGeom = pgParser.parseMultiPolygon(row[2]);
    return Lake(row[0], row[1], row[2]);
  }

  Airport mapAirportData(PostgreSQLResultRow row) {
    // var airportLocation = pgParser.parsePoint(row[6]);
    return Airport(row[0], row[1], row[2], row[3], row[4], row[5], row[6]);
  }

  Region mapRegionData(PostgreSQLResultRow row) {
    return Region(row[0], row[1], row[2], row[3]);
  }

}
