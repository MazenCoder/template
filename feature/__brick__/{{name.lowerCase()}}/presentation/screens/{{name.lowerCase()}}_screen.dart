import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:tiaragroup/features/{{name.lowerCase()}}/presentation/providers/{{name.lowerCase()}}_logic.dart';


class {{name.pascalCase()}}Screen extends ConsumerWidget {
  static const routeName = '{{name.pascalCase()}}Screen';
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final AsyncValue<{{name.pascalCase()}}Entity?> asyncData = ref.watch({{name.lowerCase()}}LogicProvider);
    ref.listen<{{name.pascalCase()}}Entity?>({{name.lowerCase()}}LogicProvider.select((AsyncValue<{{name.pascalCase()}}Entity> data) => data.value),
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
    return Scaffold(
      body: asyncData.when(
        data: (user) {
          return const SizedBox();
        },
        loading: () {
          return const SizedBox();
        },
        error: (e, st) {
          return const SizedBox();
        },
      ),
    );
  }
}
