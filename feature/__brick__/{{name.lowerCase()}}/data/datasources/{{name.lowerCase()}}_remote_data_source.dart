import '../models/{{name.lowerCase()}}_params.dart';
import '../models/{{name.lowerCase()}}_model.dart';
import '../../../core/error/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:convert';


abstract class {{name.pascalCase()}}RemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<{{name.pascalCase()}}Model> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params);
}


@LazySingleton(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {

  @override
  Future<{{name.pascalCase()}}Model> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params) async {
    final response = await http.get(Uri.parse('link'));
    if (response.statusCode == 200) {
      return {{name.pascalCase()}}Model.fromJson(json.decode(response.body));
      } else {
      throw ServerException();
    }
  }
}