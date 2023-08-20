import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LilLoopState extends Equatable {
  final Color backgroundColor;
  final Color foregroundColor;
  final double loopSpeed;
  final double loopAngle;
  final double loopStep;
  const LilLoopState({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.loopSpeed,
    required this.loopAngle,
    required this.loopStep,
  });

  const LilLoopState.initial(
      {this.backgroundColor = Colors.black,
      this.foregroundColor = Colors.blue,
      this.loopSpeed = 0.005,
      this.loopAngle = 720.0,
      this.loopStep = 30});

  @override
  List<Object?> get props =>
      [backgroundColor, foregroundColor, loopSpeed, loopAngle, loopStep];

  LilLoopState copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    double? loopSpeed,
    double? loopAngle,
    double? loopStep,
  }) {
    return LilLoopState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      loopSpeed: loopSpeed ?? this.loopSpeed,
      loopAngle: loopAngle ?? this.loopAngle,
      loopStep: loopStep ?? this.loopStep,
    );
  }
}
