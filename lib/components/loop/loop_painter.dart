import 'dart:math';

import 'package:flutter/material.dart';
import 'package:useless_app/cubit/loop/loop_state.dart';

class LoopPainter extends CustomPainter {
  final LoopState state;
  double theta;
  late final double maxAngle;
  late final double step;
  late final Paint backgroundPaint;
  LoopPainter({
    required this.state,
    required this.theta,
  }) {
    backgroundPaint = Paint()
      ..color = state.backgroundColor
      ..style = PaintingStyle.fill;
    step = state.loopStep;
    maxAngle = state.loopAngle;
  }
  @override
  void paint(Canvas canvas, Size size) {
    final rectangle = Offset.zero & size;
    canvas.drawRect(rectangle, backgroundPaint);
    final c = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;
    for (double angle = 0.0; angle < maxAngle; angle += step) {
      drawCircle(canvas, c, radius, angle, theta);
      radius = radius * 0.8;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawCircle(
      Canvas canvas, Offset c, double radius, double angle, double theta) {
    final paint = Paint()
      ..color = state.foregroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(c, radius, paint);
    final k = radius * 2;
    final rectangle =
        Rect.fromCenter(center: Offset.zero, width: k * 0.8, height: k * 0.98);
    canvas.save();
    canvas.translate(c.dx, c.dy);
    canvas.rotate(angle * pi / 180.0 + theta);
    canvas.drawOval(rectangle, backgroundPaint);
    canvas.restore();
  }
}
