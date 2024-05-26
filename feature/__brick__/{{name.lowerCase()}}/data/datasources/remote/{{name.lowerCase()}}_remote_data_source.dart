import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:flutter/foundation.dart';
import '../../models/{{name.lowerCase()}}_params.dart';
import 'dart:convert';




part '{{name.lowerCase()}}_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
{{name.pascalCase()}}RemoteDataSource {{name.lowerCase()}}RemoteDataSource({{name.pascalCase()}}RemoteDataSourceRef ref) {
  return {{name.pascalCase()}}RemoteDataSource(
    apiClient: ref.watch(apiClientProvider),
  );
}


abstract class I{{name.pascalCase()}}RemoteDataSource {

  Future<{{name.pascalCase()}}Model> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params);

}


class {{name.pascalCase()}}RemoteDataSource implements I{{name.pascalCase()}}RemoteDataSource {

  final IApiClient apiClient;

  const {{name.pascalCase()}}RemoteDataSource({
    required this.apiClient,
  });


  @override
  Future<{{name.pascalCase()}}Entity> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params) async {
    try {
      final response = await apiClient.postData(
        url: '$baseUrlApi/{{name.lowerCase()}}',
        data: params.toJson(),
      );
      if (kDebugMode) logger.i('{{name.pascalCase()}}: ${response.statusCode}\n${response.body}\n');
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return {{name.pascalCase()}}Entity.fromJson(jsonResponse['data']);
      } else {
        throw ServerFailure(
          type: ServerExceptionType.general,
          message: jsonResponse['message'],
        );
      }
    } on ServerFailure catch (failure) {
      if (kDebugMode) logger.e(failure.message);
      throw ServerFailure(
        message: failure.message,
        type: failure.type,
      );
    }
  }
}
