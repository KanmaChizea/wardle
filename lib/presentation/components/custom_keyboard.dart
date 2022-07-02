import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/data/exceptions.dart';
import 'package:woodul/data/dataprocessing_functions.dart';
import 'package:woodul/logic/cell/cell_cubit.dart';
import 'package:woodul/logic/cell/cell_state_cubit.dart';
import 'package:woodul/logic/keyboard/controller_cubit.dart';
import 'package:woodul/logic/keyboard/key_state.dart';

import 'error_snackbar.dart';

class CustomKeyBoard extends StatefulWidget {
  final List<TextEditingController> controllers;
  const CustomKeyBoard({
    Key? key,
    required this.controllers,
  }) : super(key: key);

  @override
  State<CustomKeyBoard> createState() => _CustomKeyBoardState();
}

class _CustomKeyBoardState extends State<CustomKeyBoard> {
  late int index;

  @override
  void initState() {
    index = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    BlocProvider.of<CellCubit>(context, listen: true);

    final keyWidth = width / 12;
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          color: Colors.transparent,
          height: 190,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                buildKey(keyWidth, 'Q'),
                buildKey(keyWidth, 'W'),
                buildKey(keyWidth, 'E'),
                buildKey(keyWidth, 'R'),
                buildKey(keyWidth, 'T'),
                buildKey(keyWidth, 'Y'),
                buildKey(keyWidth, 'U'),
                buildKey(keyWidth, 'I'),
                buildKey(keyWidth, 'O'),
                buildKey(keyWidth, 'P'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                buildKey(keyWidth, 'A'),
                buildKey(keyWidth, 'S'),
                buildKey(keyWidth, 'D'),
                buildKey(keyWidth, 'F'),
                buildKey(keyWidth, 'G'),
                buildKey(keyWidth, 'H'),
                buildKey(keyWidth, 'J'),
                buildKey(keyWidth, 'K'),
                buildKey(keyWidth, 'L'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                buildSpecialKey(Icons.keyboard_return),
                buildKey(keyWidth, 'Z'),
                buildKey(keyWidth, 'X'),
                buildKey(keyWidth, 'C'),
                buildKey(keyWidth, 'V'),
                buildKey(keyWidth, 'B'),
                buildKey(keyWidth, 'N'),
                buildKey(keyWidth, 'M'),
                buildSpecialKey(Icons.backspace_outlined),
              ]),
            ],
          ),
        ));
  }

  buildSpecialKey(IconData icon) {
    return BlocBuilder<ControllerCubit, List<TextEditingController>>(
      builder: (context, controllerState) {
        return BlocBuilder<CellCubit, int>(
          builder: (context, indexState) {
            return InkWell(
                onTap: (() {
                  if (icon == Icons.backspace_outlined) {
                    try {
                      delete(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar('Nothing to delete', context));
                    }
                  }
                  if (icon == Icons.keyboard_return) {
                    try {
                      enter(context);
                    } on NotEnoughLetters {
                      ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar('Not enough letters', context));
                    } on WordDoesNotExist {
                      ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar('Word does not exist', context));
                    }
                  }
                }),
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Icon(
                      icon,
                      size: 23,
                      color: Colors.white,
                    ))));
          },
        );
      },
    );
  }

  buildKey(double keyWidth, String letter) {
    return InkWell(
      onTap: () {
        try {
          add(context, letter);
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar('End of word', context));
        }
      },
      child: BlocBuilder<KeyStateCubit, Map<String, CellState>>(
          builder: (context, state) {
        String keyValue = letter.toLowerCase();
        return Container(
            width: keyWidth,
            height: 50,
            decoration: BoxDecoration(
                color: state.containsKey(keyValue) &&
                        state[keyValue] == CellState.ww
                    ? Colors.grey.shade900
                    : state.containsKey(keyValue) &&
                            state[keyValue] == CellState.rw
                        ? Colors.yellow
                        : state.containsKey(keyValue) &&
                                state[keyValue] == CellState.rr
                            ? Colors.green
                            : Colors.grey.shade700,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(
              letter,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )));
      }),
    );
  }
}
