import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../core/util/boxes.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements Boxes {}

void main() {

  const cached_{{name.lowerCase()}} = 'cached_{{name.lowerCase()}}';
  late {{name.pascalCase()}}LocalDataSourceImpl dataSource;
  const TEST_MOCK_STORAGE = './test/fixtures/core';
  late Box box;

  setUp(() {
    const channel = MethodChannel(
      'plugins.flutter.io/path_provider',);
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return TEST_MOCK_STORAGE;
    });
    dataSource = {{name.pascalCase()}}LocalDataSourceImpl();
    box = Boxes.appCached();
  });

  group('getLast{{name.pascalCase()}}', () {
    test(
      'should return {{name.pascalCase()}} from hive when there is one in the cache',
      () async {

        Hive.init(TEST_MOCK_STORAGE);
        await Hive.openBox<dynamic>('appCached');
        box = Hive.box<dynamic>('appCached');

        final model = {{name.pascalCase()}}Model.fromJson(json.decode(fixture('{{name.lowerCase()}}_cached.json')));

        // arrange
        when(box.get(any)).thenReturn(fixture('{{name.lowerCase()}}_cached.json'));
        // act
        final result = await dataSource.getLast{{name.pascalCase()}}();
        // assert
        verify(box.get(cached_{{name.lowerCase()}}));
        expect(result, equals(model));
      },
    );

    ///----------

  group('getLastNumberTrivia', () {
  final tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));

  test(
  'should return NumberTrivia from SharedPreferences when there is one in the cache',
  () async {
  // arrange
  when(mockSharedPreferences.getString(any))
      .thenReturn(fixture('trivia_cached.json'));
  // act
  final result = await dataSource.getLastNumberTrivia();
  // assert
  verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
  expect(result, equals(tNumberTriviaModel));
  },
  );

  test(
  'should throw a CacheExeption when there is not a cached value',
  () async {
  // arrange
  when(mockSharedPreferences.getString(any)).thenReturn(null);
  // act
  final call = dataSource.getLastNumberTrivia;
  // assert
  expect(() => call(), throwsA(TypeMatcher<CacheException>()));
  },
  );
  });

  group('cacheNumberTrivia', () {
  final tNumberTriviaModel =
  NumberTriviaModel(number: 1, text: 'test trivia');

  test(
  'should call SharedPreferences to cache the data',
  () async {
  // act
  dataSource.cacheNumberTrivia(tNumberTriviaModel);
  // assert
  final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
  verify(mockSharedPreferences.setString(
  CACHED_NUMBER_TRIVIA,
  expectedJsonString,
  ));
  },
  );
  });
}
