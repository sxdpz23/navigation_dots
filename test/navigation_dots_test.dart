import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:navigation_dots/navigation_dots.dart';

void main() {
  test('Use navigation dots', () {
    NavigationDots(
      children: <Widget>[
        Container(color: Colors.blueAccent),
        Container(color: Colors.greenAccent),
        Container(color: Colors.pinkAccent),
      ],
    );
  });
}
