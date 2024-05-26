import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.lowerCase()}}_entity.freezed.dart';
part '{{name.lowerCase()}}_entity.g.dart';


@freezed
class {{name.pascalCase()}}Entity with _${{name.pascalCase()}}Entity {
  const factory {{name.pascalCase()}}Entity({
    @JsonKey(name: '_id') required String id,
    required String username,
    @Default(0) int status,
  }) = _{{name.pascalCase()}}Entity;

  factory {{name.pascalCase()}}Entity.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}EntityFromJson(json);
}
