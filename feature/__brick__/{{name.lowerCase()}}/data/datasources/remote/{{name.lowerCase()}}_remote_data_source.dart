import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiaragroup/core/injection/injection.dart';
import 'package:tiaragroup/core/services/api_service.dart';
import 'package:tiaragroup/core/usecases/api_constants.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/models/{{name.lowerCase()}}_params.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';




part '{{name.lowerCase()}}_remote_data_source.g.dart';

@riverpod
{{name.pascalCase()}}RemoteDataSource {{name.lowerCase()}}RemoteDataSource(Ref ref) {
  return {{name.pascalCase()}}RemoteDataSource();
}


abstract class I{{name.pascalCase()}}RemoteDataSource {

  Future<{{name.pascalCase()}}Entity> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params);

}


class {{name.pascalCase()}}RemoteDataSource implements I{{name.pascalCase()}}RemoteDataSource {


  @override
  Future<{{name.pascalCase()}}Entity> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params) async {
    return await getIt<ApiService>().post(
      endpoint: ApiConstants.{{name.lowerCase()}},
      body: params.toJson(),
      onSuccess: (Map<String, dynamic> json) => {{name.pascalCase()}}Entity.fromJson(json),
    );
  }
}
