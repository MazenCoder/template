import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiaragroup/core/error/failure.dart';
import 'package:tiaragroup/core/network/network_handler.dart';

import 'package:tiaragroup/features/{{name.lowerCase()}}/data/datasources/local/{{name.lowerCase()}}_local_data_source.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/datasources/remote/{{name.lowerCase()}}_remote_data_source.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/repositories/{{name.lowerCase()}}_repository.dart';
import 'package:dartz/dartz.dart';



part '{{name.lowerCase()}}_repository.g.dart';


@riverpod
{{name.pascalCase()}}Repository {{name.lowerCase()}}Repository(Ref ref) {
  return {{name.pascalCase()}}Repository(
    remoteDataSource: ref.watch({{name.lowerCase()}}RemoteDataSourceProvider),
    localDataSource: ref.watch({{name.lowerCase()}}LocalDataSourceProvider),
  );
}



class {{name.pascalCase()}}Repository with NetworkHandler implements I{{name.pascalCase()}}Repository {

  final I{{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final I{{name.pascalCase()}}LocalDataSource localDataSource;

  const {{name.pascalCase()}}Repository({
    required this.remoteDataSource,
    required this.localDataSource,
  });


  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> getConcrete{{name.pascalCase()}}() {
    return handleNetworkCall<{{name.pascalCase()}}Entity>(
      remoteRequest: () => remoteDataSource.getConcrete{{name.pascalCase()}}(),
    );
  }

}


