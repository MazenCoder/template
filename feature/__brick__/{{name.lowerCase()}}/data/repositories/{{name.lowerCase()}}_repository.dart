import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../datasources/remote/{{name.lowerCase()}}_remote_data_source.dart';
import '../datasources/local/{{name.lowerCase()}}_local_data_source.dart';
import '../../domain/entities/{{name.lowerCase()}}_entity.dart';
import '../../domain/repositories/{{name.lowerCase()}}_repository.dart';
import '../../../../core/services/network/network_info.dart';
import '../models/{{name.lowerCase()}}_params.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';



part '{{name.lowerCase()}}_repository.g.dart';


@Riverpod(keepAlive: true)
{{name.pascalCase()}}Repository {{name.lowerCase()}}Repository({{name.pascalCase()}}RepositoryRef ref) {
  return {{name.pascalCase()}}Repository(
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch({{name.lowerCase()}}RemoteDataSourceProvider),
    localDataSource: ref.watch({{name.lowerCase()}}LocalDataSourceProvider),
  );
}



class {{name.pascalCase()}}Repository implements I{{name.pascalCase()}}Repository {

  {{name.pascalCase()}}Repository({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final I{{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final I{{name.pascalCase()}}LocalDataSource localDataSource;
  final INetworkInfo networkInfo;


  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params) async {
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


  /* Eg
  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}ById({{name.pascalCase()}}Params params) async {
    if (await networkInfo.hasConnection) {
      try {
        final remoteResult = await remoteDataSource.get{{name.pascalCase()}}ById(id);
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
  */

}


