import 'package:blue_app/res/colors.dart';
import 'package:equatable/equatable.dart';
import 'package:hexcolor/hexcolor.dart';

enum LetterStatus { initial, notInWord, inWord, correct }

class Letter extends Equatable {
  const Letter({required this.val, this.status = LetterStatus.initial});

  factory Letter.empty() => const Letter(val: "");

  final String val;
  final LetterStatus status;

  HexColor get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return white;
      case LetterStatus.notInWord:
        return white;
      case LetterStatus.inWord:
        return orange;
      case LetterStatus.correct:
        return green;
    }
  }

  @override
  List<Object?> get props => [val, status];

  Letter copyWith({
    String? val,
    LetterStatus? status,
  }) {
    return Letter(
      val: val ?? this.val,
      status: status ?? this.status,
    );
  }
}
