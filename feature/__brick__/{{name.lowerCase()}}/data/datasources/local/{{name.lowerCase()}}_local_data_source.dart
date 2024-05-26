import '../models/{{name.lowerCase()}}_model.dart';
import '../../../../core/error/exceptions.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/util/boxes.dart';
import 'package:meta/meta.dart';
import 'dart:convert';




part '{{name.lowerCase()}}_local_data_source.g.dart';

@Riverpod(keepAlive: true)
{{name.pascalCase()}}LocalDataSource authLocalDataSource({{name.pascalCase()}}LocalDataSourceRef ref) {
  return {{name.pascalCase()}}LocalDataSource(
    localStorageService: ref.watch(localStorageProvider),
  );
}


abstract class IAuthLocalDataSource {
  Future<void> store{{name.pascalCase()}}({{name.pascalCase()}}Entity entity);
  FutureOr<UserCreateEntity> get{{name.pascalCase()}}();

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