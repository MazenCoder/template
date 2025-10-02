import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiaragroup/core/error/failure.dart';
import 'package:tiaragroup/core/storage/local_storage.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';


part '{{name.lowerCase()}}_local_data_source.g.dart';

@riverpod
{{name.pascalCase()}}LocalDataSource {{name.lowerCase()}}LocalDataSource(Ref ref) {
  return {{name.pascalCase()}}LocalDataSource(
    localStorageService: ref.read(localStorageProvider),
  );
}

abstract class I{{name.pascalCase()}}LocalDataSource {

  Future<void> store{{name.pascalCase()}}({{name.pascalCase()}}Entity entity);
  FutureOr<{{name.pascalCase()}}Entity> get{{name.pascalCase()}}();

  Future<void> removeKey(String key);

}


class {{name.pascalCase()}}LocalDataSource implements I{{name.pascalCase()}}LocalDataSource {

  const {{name.pascalCase()}}LocalDataSource({required this.localStorageService});

  final ILocalStorage localStorageService;

  static const _key = 'entity{{name.pascalCase()}}';

  @override
  Future<void> removeKey(String key) => localStorageService.remove(key);

  @override
  Future<void> store{{name.pascalCase()}}({{name.pascalCase()}}Entity entity) {
    return localStorageService.setString(
      value: json.encode(entity.toJson()),
      key: _key,
    );
  }

  @override
  FutureOr<{{name.pascalCase()}}Entity> get{{name.pascalCase()}}() {
  final jsonString = localStorageService.getString(_key);
  if (jsonString != null) {
    return {{name.pascalCase()}}Entity.fromJson(json.decode(jsonString));
    } else {
      throw ServerFailure(
        type: ExceptionType.cache,
        message: 'error_connection'.tr(),
      );
    }
  }

}