import 'package:jts_dart_protobuf/example/alaska-db-adapter.dart';
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

}