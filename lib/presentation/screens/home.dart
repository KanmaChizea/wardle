import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:woodul/logic/cell/form_cubit.dart';
import 'package:woodul/logic/keyboard/controller_cubit.dart';
import 'package:woodul/logic/result/result_cubit.dart';

import 'package:woodul/presentation/components/custom_keyboard.dart';
import 'package:woodul/presentation/components/gameover.dart';

import '../components/form.dart';

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
        child: BlocListener<ResultCubit, ResultState>(
          listener: (context, state) {
            if (state is Won) {
              showDialog(
                  context: context,
                  builder: (context) => const GameOver(title: 'Level Passed'),
                  barrierDismissible: false);
            }
            if (state is Failed) {
              showDialog(
                  context: context,
                  builder: (context) => const GameOver(title: 'Level Failed'),
                  barrierDismissible: false);
            }
          },
          child: BlocBuilder<FormCubit, int>(builder: (context, state) {
            return BlocBuilder<ControllerCubit, List<TextEditingController>>(
              builder: (context, controller) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 50),
                      TextFieldRow(
                          rowNo: 0,
                          enabled: state == 1,
                          controllers: state == 1 ? controller : null),
                      const SizedBox(height: 8),
                      TextFieldRow(
                          rowNo: 1,
                          enabled: state == 2,
                          controllers: state == 2 ? controller : null),
                      const SizedBox(height: 8),
                      TextFieldRow(
                          rowNo: 2,
                          enabled: state == 3,
                          controllers: state == 3 ? controller : null),
                      const SizedBox(height: 8),
                      TextFieldRow(
                          rowNo: 3,
                          enabled: state == 4,
                          controllers: state == 4 ? controller : null),
                      const SizedBox(height: 8),
                      TextFieldRow(
                          rowNo: 4,
                          enabled: state == 5,
                          controllers: state == 5 ? controller : null),
                      const SizedBox(height: 8),
                      TextFieldRow(
                          rowNo: 5,
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
      ),
    );
  }
}
