import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/keyboard_controllers/cubit/controller_cubit.dart';

import 'package:woodul/logic/keyboard_controllers/cubit/form_cubit.dart';
import 'package:woodul/presentation/components/cell.dart';
import 'package:woodul/presentation/components/custom_keyboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<TextEditingController> controllers =
      List.generate(24, (index) => TextEditingController());
  List<TextEditingController> subcontroller = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FormCubit, int>(builder: (context, state) {
          return BlocBuilder<ControllerCubit, List<TextEditingController>>(
            builder: (context, controller) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 50),
                    TextFieldRow(
                        enabled: state == 1,
                        controllers: state == 1 ? controller : null),
                    const SizedBox(height: 8),
                    TextFieldRow(
                        enabled: state == 2,
                        controllers: state == 2 ? controller : null),
                    const SizedBox(height: 8),
                    TextFieldRow(
                        enabled: state == 3,
                        controllers: state == 3 ? controller : null),
                    const SizedBox(height: 8),
                    TextFieldRow(
                        enabled: state == 4,
                        controllers: state == 4 ? controller : null),
                    const SizedBox(height: 8),
                    TextFieldRow(
                        enabled: state == 5,
                        controllers: state == 5 ? controller : null),
                    const SizedBox(height: 8),
                    TextFieldRow(
                        enabled: state == 6,
                        controllers: state == 6 ? controller : null),
                    Flexible(child: Container()),
                    CustomKeyBoard(
                      controllers: controllers,
                    )
                  ]);
            },
          );
        }),
      ),
    );
  }
}

class TextFieldRow extends StatelessWidget {
  const TextFieldRow({
    Key? key,
    this.controllers,
    required this.enabled,
  }) : super(key: key);

  final List<TextEditingController>? controllers;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextCell(
              controller: controllers?[0], autoFocus: true, enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[1], autoFocus: false, enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[2], autoFocus: false, enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[3], autoFocus: false, enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[4], autoFocus: false, enabled: enabled)
        ],
      ),
    );
  }
}
