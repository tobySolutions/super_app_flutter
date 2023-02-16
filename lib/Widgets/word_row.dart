import 'package:flutter/material.dart';

import '../res/colors.dart';

class WordRow extends StatelessWidget {
  const WordRow(
      {super.key,
      required this.color,
      required this.inputText,
      required this.inputs});
  final String inputText;
  final Color color;
  final List<String> inputs;

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
            itemCount: 6,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                inputs[index],
                style: TextStyle(
                  color: white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
