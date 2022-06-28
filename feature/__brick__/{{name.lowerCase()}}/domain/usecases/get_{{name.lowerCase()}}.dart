import '../repositories/{{name.lowerCase()}}_repository.dart';
import '../../data/models/{{name.lowerCase()}}_params.dart';
import '../entities/{{name.lowerCase()}}_entity.dart';
import '../../../core/usecases/usecase.dart';
import '../../../core/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


class Get{{name.pascalCase()}} implements UseCase<{{name.pascalCase()}}Entity, {{name.pascalCase()}}Params> {
  final {{name.pascalCase()}}Repository repository;

  Get{{name.pascalCase()}}(this.repository);

  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> call({{name.pascalCase()}}Params params) async {
    return await repository.getConcrete{{name.pascalCase()}}(params);
  }
}

