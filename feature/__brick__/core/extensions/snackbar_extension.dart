import 'package:deals/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';


extension SnackbarExtension on BuildContext {
  void showCustomSnackBar({
    required Color backgroundColor,
    required String message,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: textColor ?? this.textTheme.labelMedium?.color,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
