import 'package:easy_localization/easy_localization.dart';
import '../entities/{{name.lowerCase()}}_entity.dart';
import 'dart:convert';



class {{name.pascalCase()}}Converter {

  static List<{{name.pascalCase()}}Entity> toList(dynamic data) {
    var jsonResponse = jsonDecode(data) as Map<String, dynamic>;
    List<dynamic> results = jsonResponse['list'] ?? [];
    if (results.isNotEmpty) {
      return results.map((item) => {{name.pascalCase()}}Entity.fromJson(item)).toList();
    } else {
      return [];
    }
  }

  static {{name.pascalCase()}}Entity toEntity(dynamic data) {
    var jsonResponse = jsonDecode(data) as Map<String, dynamic>;
    return {{name.pascalCase()}}Entity.fromJson(jsonResponse['data']);
  }

  static String messageError(dynamic data) {
    var jsonResponse = jsonDecode(data) as Map<String, dynamic>;
    return jsonResponse['message'] ?? 'something_wrong'.tr();
  }

}
