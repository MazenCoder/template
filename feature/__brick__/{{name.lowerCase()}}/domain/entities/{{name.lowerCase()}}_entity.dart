import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.lowerCase()}}_entity.freezed.dart';
part '{{name.lowerCase()}}_entity.g.dart';


@freezed
abstract class {{name.pascalCase()}}Entity with _${{name.pascalCase()}}Entity {

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory {{name.pascalCase()}}Entity({
    @Default(false) bool success,
    @Default('') String message,
  }) = _{{name.pascalCase()}}Entity;

  factory {{name.pascalCase()}}Entity.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}EntityFromJson(json);
}
