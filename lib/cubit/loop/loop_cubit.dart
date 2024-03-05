import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useless_app/cubit/loop/loop_state.dart';
import 'package:useless_app/utils/get_random_color.dart';

class LoopCubit extends Cubit<LoopState> {
  LoopCubit()
      : super(
          LoopState(
              loopAngle: 720.0,
              loopStep: 30,
              loopSpeed: 0.005,
              backgroundColor: getRandomColor(),
              foregroundColor: getRandomColor(),
              hasStarted: false),
        );

  void start() {
    emit(
      state.copyWith(hasStarted: true),
    );
  }

  void reset() {
    var bg = getRandomColor();
    Color fg;
    do {
      fg = getRandomColor(other: bg);
    } while (fg.value == bg.value);
    emit(
      LoopState(
          loopAngle: 720.0,
          loopStep: 30,
          loopSpeed: 0.005,
          backgroundColor: bg,
          foregroundColor: fg,
          hasStarted: state.hasStarted),
    );
  }

  void updateState(
      {Color? backgroundColor,
      Color? foregroundColor,
      double? loopSpeed,
      double? loopAngle,
      double? loopStep}) {
    emit(
      state.copyWith(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          loopSpeed: loopSpeed,
          loopAngle: loopAngle,
          loopStep: loopStep),
    );
  }
}
