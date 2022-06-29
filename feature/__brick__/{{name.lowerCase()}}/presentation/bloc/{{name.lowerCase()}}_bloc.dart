import '../../domain/entities/{{name.lowerCase()}}_entity.dart';
import '../../domain/usecases/get_{{name.lowerCase()}}.dart';
import '../../data/models/{{name.lowerCase()}}_params.dart';
import '../../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'dart:async';

part '{{name.lowerCase()}}_event.dart';
part '{{name.lowerCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {

  final Get{{name.pascalCase()}} get{{name.pascalCase()}};
  {{name.pascalCase()}}Bloc({required this.get{{name.pascalCase()}}}) : super({{name.pascalCase()}}Initial()) {
    on<{{name.pascalCase()}}Event>((event, emit) async {
      if (event is Get{{name.pascalCase()}}Event) {
        try {
          emit({{name.pascalCase()}}Loading());
          Either<Failure, {{name.pascalCase()}}Entity> either = await get{{name.pascalCase()}}.call(event.params);
          either.fold((failure) {
            final msg = failure.props.elementAt(0) ?? 'error_wrong'.tr;
            emit({{name.pascalCase()}}Error(message: '$msg'));
          }, (values) {
            emit({{name.pascalCase()}}Loaded(entity: values));
          });
        } catch(e) {
          emit({{name.pascalCase()}}Error(message: e.toString()));
        }
      }
    });
  }
}
