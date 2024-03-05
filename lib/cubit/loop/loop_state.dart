import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoopState extends Equatable {
  final Color backgroundColor;
  final Color foregroundColor;
  final double loopSpeed;
  final double loopAngle;
  final double loopStep;
  const LoopState({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.loopSpeed,
    required this.loopAngle,
    required this.loopStep,
  });

  @override
  List<Object?> get props =>
      [backgroundColor, foregroundColor, loopSpeed, loopAngle, loopStep];

  LoopState copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    double? loopSpeed,
    double? loopAngle,
    double? loopStep,
  }) {
    return LoopState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      loopSpeed: loopSpeed ?? this.loopSpeed,
      loopAngle: loopAngle ?? this.loopAngle,
      loopStep: loopStep ?? this.loopStep,
    );
  }
}
