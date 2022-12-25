import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodul/presentation/styles/colors.dart';

import 'package:woodul/presentation/styles/textstyles.dart';
import 'package:woodul/presentation/widgets/background.dart';

import '../widgets/custom_appbar.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final example1 = [
    {'letter': 'B', 'color': grey1},
    {'letter': 'U', 'color': grey1},
    {'letter': 'I', 'color': grey1},
    {'letter': 'L', 'color': grey1},
    {'letter': 'D', 'color': grey1},
  ];
  final example2 = [
    {'letter': 'C', 'color': grey1},
    {'letter': 'R', 'color': grey1},
    {'letter': 'O', 'color': yellow},
    {'letter': 'C', 'color': grey1},
    {'letter': 'K', 'color': grey1},
  ];
  final example3 = [
    {'letter': 'H', 'color': green},
    {'letter': 'O', 'color': green},
    {'letter': 'A', 'color': grey1},
    {'letter': 'R', 'color': grey1},
    {'letter': 'S', 'color': yellow},
  ];
  final example4 = [
    {'letter': 'H', 'color': green},
    {'letter': 'O', 'color': green},
    {'letter': 'U', 'color': green},
    {'letter': 'S', 'color': green},
    {'letter': 'E', 'color': green},
  ];
  @override
  Widget build(BuildContext context) {
    return SetBackground(
        child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(
              title: 'How to play',
            ),
            Text(
                "You have 6 attempts to guess the word. Each attempt must be a valid English word. After each guess, the color of the tiles will change according to how close you are to the correct word.\n \u2022 A tile with a valid letter in the right position will turn green.\n \u2022 A tile with a valid letter but in the wrong position will turn yellow.\n \u2022 A tile with an invalid letter will turn grey\n ",
                style: GoogleFonts.quicksand(textStyle: body2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: example1
                  .map((e) => InfoCell(
                      letter: e['letter'] as String,
                      cellColor: e['color'] as Color))
                  .toList(),
            ),
            Text("None of the letters above are in the word",
                style: GoogleFonts.quicksand(textStyle: body2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: example2
                  .map((e) => InfoCell(
                      letter: e['letter'] as String,
                      cellColor: e['color'] as Color))
                  .toList(),
            ),
            Text("The letter O is a valid letter but in the wrong position",
                style: GoogleFonts.quicksand(textStyle: body2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: example3
                  .map((e) => InfoCell(
                      letter: e['letter'] as String,
                      cellColor: e['color'] as Color))
                  .toList(),
            ),
            Text(
                "The letters H and O are valid letters in the correct position",
                style: GoogleFonts.quicksand(textStyle: body2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: example4
                  .map((e) => InfoCell(
                      letter: e['letter'] as String,
                      cellColor: e['color'] as Color))
                  .toList(),
            ),
            Text("All the letters are valid",
                style: GoogleFonts.quicksand(textStyle: body2)),
            const SizedBox(height: 24),
            Text("Congratulations! You are ready to play the game. Have fun!",
                style: GoogleFonts.quicksand(textStyle: body2)),
            const SizedBox(height: 60),
          ],
        ),
      ),
    ));
  }
}

class InfoCell extends StatelessWidget {
  final String letter;
  final Color cellColor;
  const InfoCell({
    Key? key,
    required this.letter,
    required this.cellColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      height: 52,
      width: 62,
      color: cellColor,
      alignment: Alignment.center,
      child: Text(
        letter,
        style: GoogleFonts.quicksand(textStyle: h1),
      ),
    );
  }
}
