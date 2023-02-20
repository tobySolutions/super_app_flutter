import 'package:blue_app/wordle/Model/letter_model.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';

class WordRow extends StatelessWidget {
  const WordRow({super.key, required this.color, required this.children});

  final Color color;
  final List<LetterContainer> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 310,
          height: 50,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
              itemCount: children.length,
              itemBuilder: (context, index) => children[index]
              // LetterContainer(color: color, inputText: inputText),
              ),
        ),
      ],
    );
  }
}

class LetterContainer extends StatelessWidget {
  const LetterContainer({
    super.key,
    required this.color,
    required this.inputText,
  });

  final Color color;
  final Letter inputText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Text(
        inputText.val,
        style: TextStyle(
          color: white,
          fontSize: 30,
          fontWeight: FontWeight.w800,
        ),
      )),
    );
  }
}
