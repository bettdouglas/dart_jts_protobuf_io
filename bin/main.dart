import 'package:jts_dart_protobuf/example/alaska-db-adapter.dart';
import 'package:jts_dart_protobuf/jts_protobuf_io.dart';
import 'package:postgres/postgres.dart';

void main() async {
  var connection = PostgreSQLConnection(
    'localhost',
    5432,
    'dart_test',
    username: 'postgres',
    password: 'yourpassword',
  );

  await connection.open();

  final askAlaska = AskAlaska(connection);

  final jtsSerializer = JTSSerializationHandler();
  final jtsDeserializer = JTSDeserializationHandler();

  final rivers = await askAlaska.getAlaskaRivers();

  print('Got ${rivers.length} rivers');
  var start = DateTime.now();

  for (var river in rivers) {
    final serializedRiver = jtsSerializer.serialize(river.geometry);
    final deserialized = jtsDeserializer.deserialize(serializedRiver);

    assert(
      deserialized.equalsExactGeom(river.geometry),
      '${river.name},${river.gid}',
    );
  }

  print('Took ${DateTime.now().difference(start).inMicroseconds}');

  final lakes = await askAlaska.getAlaskaLakes();

  print('Got ${lakes.length} lakes');
  start = DateTime.now();

  for (var lake in lakes) {
    final serializedRiver = jtsSerializer.serialize(lake.geometry);
    final deserialized = jtsDeserializer.deserialize(serializedRiver);

    assert(deserialized.equalsExactGeom(lake.geometry));
  }

  print('Took ${DateTime.now().difference(start).inMicroseconds}');

  await connection.close();
}
