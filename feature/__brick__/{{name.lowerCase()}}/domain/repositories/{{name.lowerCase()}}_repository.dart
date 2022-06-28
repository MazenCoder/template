import '../../data/models/{{name.lowerCase()}}_params.dart';
import '../entities/{{name.lowerCase()}}_entity.dart';
import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';


abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, {{name.pascalCase()}}Entity>> getConcrete{{name.pascalCase()}}({{name.pascalCase()}}Params params);
}
