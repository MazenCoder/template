import '../models/{{name.lowerCase()}}_model.dart';
import '../../../core/error/exceptions.dart';
import 'package:injectable/injectable.dart';
import '../../../core/util/boxes.dart';
import 'package:meta/meta.dart';
import 'dart:convert';



abstract class {{name.pascalCase()}}LocalDataSource {
  {{name.pascalCase()}}Model getLast{{name.pascalCase()}}();
  Future<void> cache{{name.pascalCase()}}({{name.pascalCase()}}Model model);
}

const cached_{{name.lowerCase()}} = 'cached_{{name.lowerCase()}}';

@LazySingleton(as: {{name.pascalCase()}}LocalDataSource)
class {{name.pascalCase()}}LocalDataSourceImpl implements {{name.pascalCase()}}LocalDataSource {

  final box = Boxes.appCached();

  @override
  {{name.pascalCase()}}Model getLast{{name.pascalCase()}}() {
    final jsonString = box.get(cached_{{name.lowerCase()}});
    if (jsonString != null) {
      return {{name.pascalCase()}}Model.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cache{{name.pascalCase()}}({{name.pascalCase()}}Model model) async {
    return await box.put(
      cached_{{name.lowerCase()}},
      json.encode(model.toJson()),
    );
  }
}