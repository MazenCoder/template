import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class {{name.pascalCase()}}Entity extends Equatable {
  final String id;

  {{name.pascalCase()}}Entity({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}