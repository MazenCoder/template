import '../../domain/entities/{{name.lowerCase()}}_entity.dart';
import 'package:flutter/material.dart';


class {{name.pascalCase()}}LoadedWidget extends StatelessWidget {
  final {{name.pascalCase()}}Entity entity;
  const {{name.pascalCase()}}LoadedWidget({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
