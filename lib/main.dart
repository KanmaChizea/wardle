import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/cell/cell_cubit.dart';
import 'package:woodul/logic/keyboard/controller_cubit.dart';
import 'package:woodul/logic/form_cubit.dart';

import 'logic/cell/cell_state_cubit.dart';
import 'logic/keyboard/key_state.dart';
import 'logic/level_cubit.dart';
import 'presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      darkTheme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey.shade800),
      home: MultiBlocProvider(
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
            create: (context) => LevelCubit(),
          ),
        ],
        child: const GameScreen(),
      ),
    );
  }
}
