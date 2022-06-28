import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'core/injection/injection.dart';
import 'core/langs/translation.dart';
import 'core/network/network_controller.dart';
import 'core/usecases/constants.dart';
import 'core/usecases/keys.dart';
import 'core/util/boxes.dart';
import 'core/util/generateMaterialColor.dart';
import 'core/util/hive_utils.dart';
import 'core/widget_helper/intro_app.dart';
import 'core/widget_helper/splash_app.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureInjection(Env.dev);
  Get.put(NetworkController());
  await networkController.getConnectionType();
  await HiveUtils.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    final box = Boxes.appCached();
    bool isFirstRun = box.get(
      Keys.intro, defaultValue: true,
    );

    String locale = box.get(
      Keys.locale, defaultValue: 'en',
    );

    logger.d('locale: $locale');
    return Container(
      color: primaryColor,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: GetMaterialApp(
          title: 'MyApp',
          translations: Translation(),
          locale: Locale(locale),
          fallbackLocale: Locale(locale),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: primaryColor,
            primaryColor: primaryColor,
            primaryTextTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              headline1: TextStyle(color: Colors.white),
              headline2: TextStyle(color: Colors.white),
            ),
            primaryIconTheme: const IconThemeData.fallback().copyWith(
              color: Colors.white,
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
            ),
          ),
          home: isFirstRun
              ? const IntroApp()
              : SplashApp(
                  home: {{name.pascalCase()}}Page(),
                  duration: 5000,
                ),
        ),
      ),
    );
  }
}
