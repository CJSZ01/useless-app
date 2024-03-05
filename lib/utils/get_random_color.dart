import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor({Color? other}) {
  final index = Random().nextInt(Colors.primaries.length);
  if (other == null) {
    return Colors.primaries[index];
  } else {
    if (Colors.primaries[index] != other) {
      return Colors.primaries[index];
    } else {
      return getRandomColor(other: other);
    }
  }
}
