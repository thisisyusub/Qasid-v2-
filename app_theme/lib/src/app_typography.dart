import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'named.dart';

extension FontWeightExt on TextStyle {
  TextStyle get w400 {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get w500 {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get w700 {
    return copyWith(fontWeight: FontWeight.w700);
  }
}

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.sp10,
  });

  factory AppTypographyData.regular() {
    return const AppTypographyData(
      sp10: TextStyle(fontSize: 10),
    );
  }

  final TextStyle sp10;

  @override
  List<Object?> get props => [
        sp10.named('sp10'),
      ];
}
