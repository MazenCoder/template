import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class HiveUtils {
  static late HiveUtils _hiveUtils;
  static Future<HiveUtils> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.openBox<dynamic>('appCached');
    _hiveUtils = HiveUtils();
    return _hiveUtils;
  }
}
