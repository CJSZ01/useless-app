import 'package:flutter/widgets.dart' show Color;
import 'package:useless_app/utils/loop_color_types_enum.dart';

typedef OnColorSelected = Function(LoopColorTypes colorType, Color color);

typedef OnLoopSpeedChanged = Function(double loopSpeed);

typedef OnLoopAngleChanged = Function(double loopAngle);

typedef OnLoopStepChanged = Function(double loopStep);

typedef OnSongChanged = Function(int song);
