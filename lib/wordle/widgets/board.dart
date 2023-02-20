import 'package:flutter/material.dart';

import '../Model/letter_model.dart';
import '../Model/word_model.dart';
import '../../res/colors.dart';
import 'word_row.dart';

class Board extends StatelessWidget {
  const Board({super.key, required this.rows, required this.letters});

  final List<Word> rows;
  final Set<Letter> letters;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: rows
            .map(
              (word) => SizedBox(
                height: 57,
                child: WordRow(
                  color: darkGrey,
                  children: word.letters.map((e) {
                    final letterKey = letters.firstWhere(
                      (element) => e.val == element.val,
                      orElse: () => Letter.empty(),
                    );
                    return LetterContainer(
                      color: letterKey != Letter.empty()
                          ? letterKey.backgroundColor
                          : darkGrey,
                      inputText: e,
                    );
                  }).toList(),
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
