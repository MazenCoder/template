import '../../domain/repositories/{{name.lowerCase()}}_repository.dart';
import '../datasources/{{name.lowerCase()}}_remote_data_source.dart';
import '../datasources/{{name.lowerCase()}}_local_data_source.dart';
import '../models/{{name.lowerCase()}}_params.dart';
import '../models/{{name.lowerCase()}}_model.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';


@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;

  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params) async {
    if (await networkController.isConnected) {
      try {
        {{name.pascalCase()}}Model model = await remoteDataSource.getConcrete{{name.pascalCase()}}(params);
        await localDataSource.cache{{name.pascalCase()}}(model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure(message: 'error_server'.tr));
      }
    } else {
      try {
        {{name.pascalCase()}}Model model = await localDataSource.getLast{{name.pascalCase()}}();
        return Right(model);
      } on CacheException {
        logger.e("error_connection".tr);
        return Left(CacheFailure(message: "error_connection".tr));
      }
    }
  }
}
