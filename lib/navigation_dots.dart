library navigation_dots;

import 'package:flutter/material.dart';

part 'src/navigationDots.dart';
part 'src/dock.dart';

/// Model
///
/// Class to assign the bar attributes which is in the background of the dots
class NavigatorBar {
  final double size;
  final Color color;

  const NavigatorBar({required this.size, required this.color});
}

/// Model
///
/// Class to assign the style attributes to the dots that help you navigate to diff pages
class NavigatorDot {
  final Color color;
  final Color shade;
  final double onTapSize;
  final double size;

  const NavigatorDot(
      {required this.onTapSize,
      required this.size,
      required this.color,
      required this.shade});
}
