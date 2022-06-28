import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../usecases/constants.dart';
import '../util/generateMaterialColor.dart';
import 'error_app.dart';
import 'responsive_safe_area.dart';

late Widget _home;
int _duration = 1000;

class SplashApp extends StatefulWidget {
  SplashApp({
    required Widget home,
    required int duration,
    bool isInitServices = true,
    Key? key,
  }) : super(key: key) {
    _home = home;
    _duration = duration;
  }

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (_duration < 1000) _duration = 2500;
    _initAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initServices();
    });
  }

  void _initAnimation() {
    try {
      _animationController = AnimationController(
          duration: const Duration(seconds: 5), vsync: this);
      final curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      );

      _animation =
          Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                _animationController.reverse();
              } else if (status == AnimationStatus.dismissed) {
                _animationController.forward();
              }
            });
      _animationController.forward();
    } catch (e) {
      logger.i("error, $e");
      _animationController.dispose();
    }
  }

  Future<void> _initServices() async {
    try {
      if (networkController.isConnected) {
        return Get.offAll(() => _home);
      } else {
        return Get.offAll(() => ErrorApp(
              message: 'error_connection'.tr,
            ));
      }
    } catch (e) {
      logger.e(e);
      return Get.offAll(() => ErrorApp(
            message: 'error_wrong'.tr,
          ));
    }
  }

  @override
  void didChangeDependencies() {
    // precacheImage(const AssetImage(IMG.logo), context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveSafeArea(
      color: Colors.white,
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                    // child: Image.asset(
                    //   IMG.logo,
                    //   fit: BoxFit.contain,
                    //   width: size.width / 2,
                    //   height: size.width / 2,
                    //   filterQuality: FilterQuality.high,
                    // ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'name_app'.tr,
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold,
                    color: headlineColor,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
