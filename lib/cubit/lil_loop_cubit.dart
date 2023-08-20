import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lil_loop/cubit/lil_loop_state.dart';

class LilLoopCubit extends Cubit<LilLoopState> {
  LilLoopCubit()
      : super(
          const LilLoopState.initial(),
        );

  void reset() {
    emit(
      const LilLoopState.initial(),
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
