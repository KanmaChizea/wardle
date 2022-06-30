import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/keyboard_controllers/cubit/cell_cubit.dart';
import 'package:woodul/logic/keyboard_controllers/cubit/controller_cubit.dart';
import 'package:woodul/logic/keyboard_controllers/cubit/form_cubit.dart';

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
        ],
        child: const GameScreen(),
      ),
    );
  }
}
