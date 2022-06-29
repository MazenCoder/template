part of '{{name.lowerCase()}}_bloc.dart';

@immutable
abstract class {{name.pascalCase()}}State {
  const {{name.pascalCase()}}State();
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {
  const {{name.pascalCase()}}Initial();
}


class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {
  const {{name.pascalCase()}}Loading();
}

class {{name.pascalCase()}}Loaded extends {{name.pascalCase()}}State {
  final {{name.pascalCase()}}Entity entity;
  const {{name.pascalCase()}}Loaded({required this.entity});
}

class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {
  final String message;
  const {{name.pascalCase()}}Error({required this.message});
}
