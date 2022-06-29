import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.lowerCase()}}.freezed.dart';

@freezed
class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const factory {{name.pascalCase()}}({
  required String firstName,
  required String lastName,
  }) = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, Object?> json)
    => _${{name.pascalCase()}}FromJson(json);
}