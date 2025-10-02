import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.lowerCase()}}_params.freezed.dart';
part '{{name.lowerCase()}}_params.g.dart';


@freezed
abstract class {{name.pascalCase()}}Params with _${{name.pascalCase()}}Params {

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory {{name.pascalCase()}}Params({
    @Default(false) bool success,
    @Default('') String message,
  }) = _{{name.pascalCase()}}Params;

  factory {{name.pascalCase()}}Params.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}ParamsFromJson(json);
}
