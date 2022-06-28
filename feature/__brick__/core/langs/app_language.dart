import 'dart:developer';

import 'package:get/get.dart';

import '../usecases/keys.dart';
import '../util/boxes.dart';

class AppLanguage extends GetxController {
  final box = Boxes.appCached();

  @override
  void onInit() {
    _getLanguage();
    super.onInit();
  }

  void saveLanguage(String lang) async {
    await box.put(Keys.locale, lang);
    update();
  }

  void _getLanguage() async {
    final lang = await box.get(Keys.locale, defaultValue: 'en');

    log('language: $lang');
  }
}
