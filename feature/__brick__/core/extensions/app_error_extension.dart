import 'package:flutter/material.dart';


extension AppErrorExtension on Object {
  String errorMessage(BuildContext context) {
    final error = this;
    return '$error';
  }
}
