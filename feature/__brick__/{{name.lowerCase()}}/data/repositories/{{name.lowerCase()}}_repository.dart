import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:tiaragroup/features/{{name.lowerCase()}}/data/datasource/local/{{name.lowerCase()}}_local_data_source.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/datasource/remote/{{name.lowerCase()}}_remote_data_source.dart';

import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/repositories/{{name.lowerCase()}}_repository.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/models/{{name.lowerCase()}}_params.dart';
import 'package:tiaragroup/core/error/failures.dart';
import 'package:tiaragroup/core/network/network_checker.dart';
import 'package:dartz/dartz.dart';



part '{{name.lowerCase()}}_repository.g.dart';


@riverpod
{{name.pascalCase()}}Repository {{name.lowerCase()}}Repository({{name.pascalCase()}}RepositoryRef ref) {
  return {{name.pascalCase()}}Repository(
    networkChecker: ref.watch(networkCheckerProvider),
    remoteDataSource: ref.watch({{name.lowerCase()}}RemoteDataSourceProvider),
    localDataSource: ref.watch({{name.lowerCase()}}LocalDataSourceProvider),
  );
}



class {{name.pascalCase()}}Repository with NetworkHandler implements I{{name.pascalCase()}}Repository {

  final I{{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final I{{name.pascalCase()}}LocalDataSource localDataSource;
  @override
  final NetworkChecker networkChecker;

  const {{name.pascalCase()}}Repository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkChecker,
  });


  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params) {
    return await handleNetworkCall<{{name.pascalCase()}}Entity>(
      remoteRequest: () => remoteDataSource.getConcrete{{name.pascalCase()}}(params),
    );
  }

}


