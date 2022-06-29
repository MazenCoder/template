import 'dart:io';

String fixture(String name) =>
    File('lib/features/test/fixtures/$name').readAsStringSync();
// String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
