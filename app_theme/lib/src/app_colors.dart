import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'named.dart';

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.background,
    required this.onBackground,
  });

  factory AppColorsData.light() => const AppColorsData(
        background: Colors.white,
        onBackground: Color(0xFF000000),
      );

  factory AppColorsData.dark() => const AppColorsData(
        background: Colors.black,
        onBackground: Colors.white,
      );

  final Color background;
  final Color onBackground;

  @override
  List<Object?> get props => [
        background.named('primary'),
        onBackground.named('onBackground'),
      ];
}
