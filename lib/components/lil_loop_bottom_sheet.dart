import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import 'package:lil_loop/components/color_picker/color_picker_dialog.dart';
import 'package:lil_loop/cubit/lil_loop_state.dart';
import 'package:lil_loop/utils/lil_loop_color_types_enum.dart';
import 'package:lil_loop/utils/lil_loop_typedefs.dart';

class LilLoopBottomSheet extends StatelessWidget {
  final LilLoopState state;
  final OnColorSelected onColorSelected;
  final OnLoopSpeedChanged onLoopSpeedChanged;
  final OnLoopAngleChanged onLoopAngleChanged;
  final OnLoopStepChanged onLoopStepChanged;
  final VoidCallback onReset;
  const LilLoopBottomSheet({
    Key? key,
    required this.state,
    required this.onColorSelected,
    required this.onLoopSpeedChanged,
    required this.onLoopAngleChanged,
    required this.onLoopStepChanged,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onReset,
            child: const Text('Reset'),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Loop speed'),
              SizedBox(
                height: 50,
                child: Slider(
                  value: state.loopSpeed,
                  onChanged: onLoopSpeedChanged,
                  max: 0.5,
                  min: 0.005,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Loop depth'),
              SizedBox(
                height: 50,
                child: Slider(
                  value: state.loopAngle,
                  onChanged: onLoopAngleChanged,
                  max: 900,
                  min: 1,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Loop step'),
              SizedBox(
                height: 50,
                child: Slider(
                  value: state.loopStep,
                  onChanged: onLoopStepChanged,
                  max: 100,
                  min: 1,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ColorPickerDialog(
                    onColorSelected: onColorSelected,
                    colorType: LilLoopColorTypes.background,
                    currentColor: state.backgroundColor),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorIndicator(
                    width: 44,
                    height: 44,
                    borderRadius: 22,
                    color: state.backgroundColor,
                  ),
                  const Text(
                    'Background color',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ColorPickerDialog(
                    onColorSelected: onColorSelected,
                    colorType: LilLoopColorTypes.foreground,
                    currentColor: state.foregroundColor),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorIndicator(
                    width: 44,
                    height: 44,
                    borderRadius: 22,
                    color: state.foregroundColor,
                  ),
                  const Text(
                    'Foreground color',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
