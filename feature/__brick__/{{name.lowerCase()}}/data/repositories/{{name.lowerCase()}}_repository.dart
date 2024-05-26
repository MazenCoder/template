import '../../domain/repositories/{{name.lowerCase()}}_repository.dart';
import '../datasources/{{name.lowerCase()}}_remote_data_source.dart';
import '../datasources/{{name.lowerCase()}}_local_data_source.dart';
import '../models/{{name.lowerCase()}}_params.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';




part 'auth_repository.g.dart';


@Riverpod(keepAlive: true)
{{name.pascalCase()}}Repository {{name.lowerCase()}}Repository({{name.pascalCase()}}RepositoryRef ref) {
  return {{name.pascalCase()}}Repository(
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch({{name.lowerCase()}}RemoteDataSourceProvider),
    localDataSource: ref.watch({{name.lowerCase()}}LocalDataSourceProvider),
  );
}



class {{name.lowerCase()}}Repository implements I{{name.lowerCase()}}Repository {

  {{name.lowerCase()}}Repository({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final I{{name.lowerCase()}}RemoteDataSource remoteDataSource;
  final I{{name.lowerCase()}}LocalDataSource localDataSource;
  final INetworkInfo networkInfo;


  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> getConcrete({{name.pascalCase()}}Params params) async {
    if (await networkInfo.hasConnection) {
      try {
        final remoteResult = await remoteDataSource.getConcrete{{name.pascalCase()}}(params);
        await localDataSource.store{{name.pascalCase()}}(remoteResult);
        return right(remoteResult);
      } on ServerFailure catch (failure) {
        return left(ServerFailure(
          message: failure.message,
          type: failure.type,
        ));
      }
    } else {
      try {
        final localResult = await localDataSource.get{{name.pascalCase()}}();
        return right(localResult);
      } on ServerFailure catch (failure) {
        return left(ServerFailure(
          message: failure.message,
          type: failure.type,
        ));
      }
    }
  }


  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}({{name.pascalCase()}}Params params) async {
    if (await networkInfo.hasConnection) {
      try {
        final remoteResult = await remoteDataSource.getPostById(id);
        return right(remoteResult);
      } on ServerFailure catch (failure) {
        return left(ServerFailure(
          message: failure.message,
          type: failure.type,
        ));
      }
    } else {
      return left(ServerFailure(
        type: ServerExceptionType.noInternet,
        message: 'error_connection'.tr(),
      ));
    }
  }

}


