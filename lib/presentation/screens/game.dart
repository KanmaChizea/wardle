import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:woodul/logic/cell/form_cubit.dart';
import 'package:woodul/logic/keyboard/controller_cubit.dart';
import 'package:woodul/logic/result/result_cubit.dart';
import 'package:woodul/presentation/styles/textstyles.dart';
import 'package:woodul/presentation/widgets/background.dart';

import 'package:woodul/presentation/widgets/custom_keyboard.dart';
import 'package:woodul/presentation/widgets/gameover.dart';

import '../../logic/level_cubit.dart';
import '../widgets/form.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SetBackground(
      child: BlocListener<ResultCubit, ResultState>(
        listener: (context, state) {
          if (state is Won) {
            showDialog(
                context: context,
                builder: (c) {
                  return GameOver(
                    title: 'Level Passed',
                    dialogContext: c,
                  );
                },
                barrierDismissible: false);
          }
          if (state is Failed) {
            showDialog(
                context: context,
                builder: (c) {
                  return GameOver(title: 'Level Failed', dialogContext: c);
                },
                barrierDismissible: false);
          }
        },
        child: BlocBuilder<FormCubit, int>(builder: (context, state) {
          return BlocBuilder<ControllerCubit, List<TextEditingController>>(
            builder: (context, controller) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Level  ${context.watch<LevelCubit>().state}',
                      style: GoogleFonts.gorditas(textStyle: h1),
                    ),
                    const SizedBox(height: 20),
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
                    CustomKeyBoard()
                  ]);
            },
          );
        }),
      ),
    );
  }
}
