import '../../../core/widget_helper/responsive_safe_area.dart';
import '../widgets/{{name.lowerCase()}}_initial_widget.dart';
import '../widgets/{{name.lowerCase()}}_loaded_widget.dart';
import '../../data/models/{{name.lowerCase()}}_params.dart';
import '../../../core/widget_helper/loading_app.dart';
import '../../../core/widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/{{name.lowerCase()}}_bloc.dart';
import '../../../core/injection/injection.dart';
import 'package:flutter/material.dart';


class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) {
        return Scaffold(
          body: BlocProvider(
            create: (_) => getIt<{{name.pascalCase()}}Bloc>()
              ..add(Get{{name.pascalCase()}}Event(params: {{name.pascalCase()}}Params())),
            child: BlocBuilder<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
              builder: (context, state) {
                if (state is {{name.pascalCase()}}Initial) {
                  return {{name.pascalCase()}}InitialWidget();
                } else if (state is {{name.pascalCase()}}Loading) {
                  return LoadingApp();
                } else if (state is {{name.pascalCase()}}Loaded) {
                  return {{name.pascalCase()}}LoadedWidget(entity: state.entity);
                } else if (state is {{name.pascalCase()}}Error) {
                  return ErrorApp(message: state.message);
                } else {
                  return const ErrorApp();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
