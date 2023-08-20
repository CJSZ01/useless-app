import 'package:flutter/widgets.dart' show Color;
import 'package:lil_loop/utils/lil_loop_color_types_enum.dart';

typedef OnColorSelected = Function(LilLoopColorTypes colorType, Color color);

typedef OnLoopSpeedChanged = Function(double loopSpeed);

typedef OnLoopAngleChanged = Function(double loopAngle);

typedef OnLoopStepChanged = Function(double loopStep);
