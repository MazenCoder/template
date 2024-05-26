import 'package:sawwlnjawwb/features/posts/domain/entities/answer_entity.dart';
import '../../../friends/domain/entities/friend_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import '../entities/post_entity.dart';
import 'dart:convert';



class {{name.pascalCase()}}Converter {

  static {{name.pascalCase()}}Entity toList(dynamic data) {
    var jsonResponse = jsonDecode(data) as Map<String, dynamic>;
    List<dynamic> posts = jsonResponse['list'] ?? [];
    if (posts.isNotEmpty) {
      return posts.map((item) => {{name.pascalCase()}}Entity.fromJson(item)).toList();
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
