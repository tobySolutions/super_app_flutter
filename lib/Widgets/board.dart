import 'package:flutter/material.dart';

import '../Model/word_model.dart';
import '../res/colors.dart';
import 'word_row.dart';

class Board extends StatelessWidget {
  const Board({super.key, required this.rows});

  final List<Word> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: rows
            .map(
              (word) => SizedBox(
                height: 57,
                child: WordRow(
                  color: darkGrey,
                  children: word.letters
                      .map(
                          (e) => LetterContainer(color: darkGrey, inputText: e))
                      .toList(),
                ),
              ),
            )
            .toList()

        //   const SizedBox(
        //     height: 8,
        //   ),
        //   WordRow(
        //     inputText: " ",
        //     color: darkGrey,
        //     inputs: inputProvider.inputs2,
        //   ),
        //   const SizedBox(
        //     height: 8,
        //   ),
        //   WordRow(
        //     inputText: " ",
        //     color: darkGrey,
        //     inputs: inputProvider.inputs3,
        //   ),
        //   const SizedBox(
        //     height: 8,
        //   ),
        //   WordRow(
        //     inputText: " ",
        //     color: darkGrey,
        //     inputs: inputProvider.inputs4,
        //   ),
        //   const SizedBox(
        //     height: 8,
        //   ),
        //   WordRow(
        //     inputText: " ",
        //     color: darkGrey,
        //     inputs: inputProvider.inputs5,
        //   ),
        //   const SizedBox(
        //     height: 8,
        //   ),
        //   WordRow(
        //     inputText: ,
        //     color: darkGrey,
        //     inputs: inputProvider.inputs6,
        //   ),
        // ],
        );
  }
}
