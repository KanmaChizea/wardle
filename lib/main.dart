import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:woodul/logic/cell/cell_cubit.dart';

import 'package:woodul/logic/keyboard/controller_cubit.dart';
import 'package:woodul/logic/cell/form_cubit.dart';
import 'package:woodul/navigation_handler.dart';

import 'logic/animation/transition_cubit.dart';
import 'logic/animation/wordle_sign_cubit.dart';
import 'logic/cell/cell_state_cubit.dart';
import 'logic/cubit/navigation_cubit.dart';
import 'logic/keyboard/key_state.dart';
import 'logic/level_cubit.dart';
import 'logic/result/result_cubit.dart';
import 'logic/animation/settings_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FormCubit(),
        ),
        BlocProvider(
          create: (context) => CellCubit(),
        ),
        BlocProvider(
          create: (context) => ControllerCubit(),
        ),
        BlocProvider(
          create: (context) => CellStateCubit(),
        ),
        BlocProvider(
          create: (context) => KeyStateCubit(),
        ),
        BlocProvider(
          create: (context) => ResultCubit(),
        ),
        BlocProvider(
          create: (context) => LevelCubit()..initializeLevel(),
        ),
        BlocProvider(
          create: (context) => WordleSignCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => TransitionCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavHandler(),
      ),
    );
  }
}
