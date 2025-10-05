import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiaragroup/core/error/failure.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/models/{{name.lowerCase()}}_params.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/data/repositories/{{name.lowerCase()}}_repository.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';

part '{{name.lowerCase()}}_logic.g.dart';

@riverpod
class {{name.pascalCase()}}Logic extends _${{name.pascalCase()}}Logic {


  @override
  FutureOr<{{name.pascalCase()}}Entity> build() => getConcrete{{name.pascalCase()}}();


  Future<{{name.pascalCase()}}Entity> getConcrete{{name.pascalCase()}}() async {
    final {{name.pascalCase()}}Repository repository = ref.read({{name.lowerCase()}}RepositoryProvider);
    final result = await repository.getConcrete{{name.pascalCase()}}();
    return result.fold((Failure l) => throw l.message, (r) {
      //! TODO: Implement Provider
      return r;
    });
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => getConcrete{{name.pascalCase()}}());
  }
}