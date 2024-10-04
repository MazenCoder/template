import '../../../../core/widgets/responsive_safe_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:flutter/material.dart';
import '../providers/{{name.lowerCase()}}_logic.dart';


class {{name.pascalCase()}}Screen extends ConsumerWidget {
  static const routeName = '{{name.pascalCase()}}Screen';
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<{{name.pascalCase()}}Entity?> asyncData = ref.watch({{name.lowerCase()}}LogicProvider);
    ref.listen<{{name.pascalCase()}}Entity?>({{name.lowerCase()}}LogicProvider.select((data) => data.valueOrNull),
            (previousData, newData) {
          if (newData != null) {
            // final hideIntro = newUser.hideIntro;
            // if (hideIntro) {
            //   context.pushReplacementNamed(NavigationScreen.routeName);
            // } else {
            //   context.pushReplacementNamed(OnboardingScreen.routeName);
            // }
          } else {
            // context.pushReplacementNamed(LoginScreen.routeName);
          }
        }
    );

    return ResponsiveSafeArea(
      context: context,
      builder: (_) {
        return Scaffold(
          body: asyncData.when(
            data: (user) {
              return const SizedBox();
            },
            loading: () {
              return const SizedBox();
              // return const LoadingApp()
            },
            error: (e, st) {
              return const SizedBox();
              // return AppError(message: '$e');
            },
          ),
        );
      },
    );
  }
}
