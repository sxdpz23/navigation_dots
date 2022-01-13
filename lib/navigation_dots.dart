library navigation_dots;

import 'package:flutter/material.dart';

part 'src/navigationDots.dart';
part 'src/dock.dart';

/// Model  |  To style the bar attributes which is in the background of the
/// dots.
class NavigatorBar {
  /// The double value for size (height) of the bar.
  /// By default, the size is set to `3 pixels`.
  final double size;

  /// The color to be given to the bar.
  /// By default, the color is given as black.
  final Color color;

  const NavigatorBar({required this.size, required this.color});
}

/// Model  |  To style the attributes to the dots that help you navigate to
/// different pages
class NavigatorDot {
  /// The color to be given to the bar.
  /// By default, the color is given as black.
  final Color color;

  /// The color to be given to the shadow of the bar.
  /// By default, the color is given as black.
  final Color shade;

  /// The size of the dot indicating the current page.
  /// By default, the value set to `20 pixels`.
  final double onTapSize;

  /// The double value for size (height) of the dot.
  /// By default, the size is set to `10 pixels`.
  final double size;

  const NavigatorDot(
      {required this.onTapSize,
      required this.size,
      required this.color,
      required this.shade});
}
