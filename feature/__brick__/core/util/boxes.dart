import 'package:hive/hive.dart';

class Boxes {
  static Box<dynamic> appCached() => Hive.box<dynamic>('appCached');
}
