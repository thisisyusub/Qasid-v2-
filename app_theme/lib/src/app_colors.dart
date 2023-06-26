import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'named.dart';

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.primary,
    required this.onBackground,
  });

  factory AppColorsData.light() => const AppColorsData(
        primary: MaterialColor(
          0xFF347AF6,
          <int, Color>{
            50: Color(0xFFE4F3FF),
            100: Color(0xFFBEE1FF),
            600: Color(0xFF328DFF),
            500: Color(0xFF2B9CFF),
            700: Color(0xFF347AF6),
            900: Color(0xFF3547C4)
          },
        ),
        onBackground: Color(0xFF000000),
      );

  final MaterialColor primary;
  final Color onBackground;

  @override
  List<Object?> get props => [
        primary.named('primary'),
        onBackground.named('onBackground'),
      ];
}
