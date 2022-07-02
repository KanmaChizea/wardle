import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/data/dataprocessing_functions.dart';
import 'package:woodul/logic/cell/cell_state_cubit.dart';
import 'package:woodul/presentation/components/iconbutton.dart';
import 'package:woodul/presentation/styles/textstyles.dart';

import '../styles/colors.dart';

class GameOver extends StatelessWidget {
  final String title;
  const GameOver({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List statusList = context.read<CellStateCubit>().state;
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 2 + 10,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: Text(title),
              titleTextStyle: h1.copyWith(color: black),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                    ))
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 16),
            const Text(
              '    GUESS DISTRIBUTION',
              style: body1,
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: 300,
                height: 160,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            (index + 1).toString(),
                            style: body1,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: guessDistribution(statusList[index]) / 5,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.green),
                              backgroundColor: Colors.grey.shade700,
                              minHeight: 15,
                            ),
                          )
                        ]),
                      );
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (title == 'Level Failed')
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.refresh),
                      label: Text('Play again')),
                ElevatedButton.icon(
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Next level'),
                    onPressed: () {})
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
