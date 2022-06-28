part of '{{name.lowerCase()}}_bloc.dart';

@immutable
abstract class {{name.pascalCase()}}Event {
  const {{name.pascalCase()}}Event();
}


class Get{{name.pascalCase()}}Event extends {{name.pascalCase()}}Event {
  final {{name.pascalCase()}}Params params;
  const Get{{name.pascalCase()}}Event({required this.params});
}
