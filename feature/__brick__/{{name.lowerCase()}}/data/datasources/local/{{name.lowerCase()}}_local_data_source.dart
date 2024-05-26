import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/{{name.lowerCase()}}_entity.dart';
import '../../../../../core/services/storage/local_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/error/failures.dart';
import 'dart:convert';



part '{{name.lowerCase()}}_local_data_source.g.dart';

@riverpod
{{name.pascalCase()}}LocalDataSource {{name.lowerCase()}}LocalDataSource({{name.pascalCase()}}LocalDataSourceRef ref) {
  return {{name.pascalCase()}}LocalDataSource(
    localStorageService: ref.watch(localStorageProvider),
  );
}


abstract class I{{name.pascalCase()}}LocalDataSource {

  Future<void> store{{name.pascalCase()}}({{name.pascalCase()}}Entity entity);
  FutureOr<{{name.pascalCase()}}Entity> get{{name.pascalCase()}}();

  FutureOr<void> storeData({required String key, required Object value});
  FutureOr<dynamic>? getData(String key);

  Future<void> removeKey(String key);

}


class {{name.pascalCase()}}LocalDataSource implements I{{name.pascalCase()}}LocalDataSource {

  const {{name.pascalCase()}}LocalDataSource({required this.localStorageService});

  final ILocalStorage localStorageService;

  static const _key = 'entity{{name.lowerCase()}}';

  @override
  Future<void> removeKey(String key) => localStorageService.deleteKey(key: key);

  @override
  Future<void> store{{name.pascalCase()}}({{name.pascalCase()}}Entity entity) {
    return localStorageService.putData(
      value: json.encode(entity.toJson()),
      key: _key,
    );
  }

  @override
  FutureOr<{{name.pascalCase()}}Entity> get{{name.pascalCase()}}() {
  final jsonString = localStorageService.getData(key: _key);
  if (jsonString != null) {
    return Future.value({{name.pascalCase()}}Entity.fromJson(json.decode('$jsonString')));
    } else {
      throw ServerFailure(
        type: ServerExceptionType.cache,
        message: 'error_connection'.tr(),
      );
    }
  }

  @override
  FutureOr<dynamic>? getData(String key) {
    return localStorageService.getData(key: key);
  }

  @override
  FutureOr<void> storeData({required String key, required Object value}) {
    return localStorageService.putData(
      value: value,
      key: key,
    );
  }

}