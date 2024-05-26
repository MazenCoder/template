import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/boxes.dart';
import '../../usecases/keys.dart';

part 'theme_service.g.dart';


@Riverpod(keepAlive: true)
class ThemeService extends _$ThemeService {


  @override
  bool build() {
    final box = Boxes.settings();
    return box.get(Keys.isDark, defaultValue: false);
  }

  void onChangeTheme(bool value) async {
    final box = Boxes.settings();
    state = value;
    ref.notifyListeners();
    await box.put(Keys.isDark, value);
  }


}