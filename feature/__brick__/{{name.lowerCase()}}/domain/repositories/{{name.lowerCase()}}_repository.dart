import 'package:dartz/dartz.dart';
import 'package:tiaragroup/core/error/failure.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/models/{{name.lowerCase()}}_params.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';


abstract class I{{name.pascalCase()}}Repository {
  Future<Either<Failure, {{name.pascalCase()}}Entity>> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params);
}
