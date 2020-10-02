///
//  Generated code. Do not modify.
//  source: geoprotobuf.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Coordinate$json = const {
  '1': 'Coordinate',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
    const {'1': 'z', '3': 3, '4': 1, '5': 1, '10': 'z'},
  ],
};

const Geometry$json = const {
  '1': 'Geometry',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.Geometry.Type', '10': 'type'},
    const {'1': 'coordinates', '3': 2, '4': 3, '5': 11, '6': '.Coordinate', '10': 'coordinates'},
    const {'1': 'geometries', '3': 3, '4': 3, '5': 11, '6': '.Geometry', '10': 'geometries'},
  ],
  '4': const [Geometry_Type$json],
};

const Geometry_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'POINT', '2': 0},
    const {'1': 'LINESTRING', '2': 1},
    const {'1': 'POLYGON', '2': 2},
    const {'1': 'MULTIPOINT', '2': 3},
    const {'1': 'MULTILINESTRING', '2': 4},
    const {'1': 'MULTIPOLYGON', '2': 5},
    const {'1': 'LINE', '2': 6},
    const {'1': 'TRIANGLE', '2': 7},
    const {'1': 'LINEARRING', '2': 8},
    const {'1': 'GEOMETRYCOLLECTION', '2': 9},
  ],
};

