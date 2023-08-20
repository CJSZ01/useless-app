import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lil_loop/components/lil_loop/lil_loop_widget.dart';
import 'package:lil_loop/components/lil_loop_bottom_sheet.dart';
import 'package:lil_loop/cubit/lil_loop_cubit.dart';
import 'package:lil_loop/cubit/lil_loop_state.dart';
import 'package:lil_loop/utils/lil_loop_color_types_enum.dart';

class LilLoopPage extends StatefulWidget {
  const LilLoopPage({super.key});

  @override
  State<LilLoopPage> createState() => _LilLoopPageState();
}

class _LilLoopPageState extends State<LilLoopPage> {
  late final LilLoopCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<LilLoopCubit>();
    super.initState();
  }

  void onColorSelected(LilLoopColorTypes colorType, Color color) {
    switch (colorType) {
      case LilLoopColorTypes.background:
        {
          _cubit.updateState(backgroundColor: color);
        }
        break;
      case LilLoopColorTypes.foreground:
        {
          _cubit.updateState(foregroundColor: color);
        }
    }
  }

  void onLoopSpeedChanged(double loopSpeed) {
    _cubit.updateState(loopSpeed: loopSpeed);
  }

  void onLoopAngleChanged(double loopAngle) {
    _cubit.updateState(loopAngle: loopAngle);
  }

  void onLoopStepChanged(double loopStep) {
    _cubit.updateState(loopStep: loopStep);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LilLoopCubit, LilLoopState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.black.withAlpha(50),
            centerTitle: true,
            title: const Text('It\'s just a lil\' loop'),
          ),
          bottomSheet: LilLoopBottomSheet(
            onReset: _cubit.reset,
            state: state,
            onColorSelected: onColorSelected,
            onLoopSpeedChanged: onLoopSpeedChanged,
            onLoopAngleChanged: onLoopAngleChanged,
            onLoopStepChanged: onLoopStepChanged,
          ),
          body: Center(
            child: LilLoopWidget(
              state: state,
            ),
          ),
        );
      },
    );
  }
}
