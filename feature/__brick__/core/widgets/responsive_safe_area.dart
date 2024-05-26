import 'package:deals/core/extensions/ui_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



typedef ResponsiveBuilder = Widget Function(BuildContext context);

class ResponsiveSafeArea extends ConsumerWidget {

  ResponsiveSafeArea({
    required ResponsiveBuilder builder,
    super.key,
    Color? color,
    bool? bottom,
    required BuildContext context,
    this.uiOverlayStyle,
  }) : responsiveBuilder = builder,
        colorContainer = color ?? context.theme.colorScheme.surface,
        allowBottom = bottom ?? false;
  final ResponsiveBuilder responsiveBuilder;
  final SystemUiOverlayStyle? uiOverlayStyle;
  // final bool showLinearGradient;
  final Color colorContainer;
  final bool allowBottom;
  // final bool reverse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeServiceProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (uiOverlayStyle != null) ?
      uiOverlayStyle! : (isDark) ?
      SystemUiOverlayStyle.light :
      SystemUiOverlayStyle.dark,
      child: Container(
        color: colorContainer,
        child: SafeArea(
          bottom: allowBottom,
          child: responsiveBuilder(context),
        ),
      ),
    );
  }
}