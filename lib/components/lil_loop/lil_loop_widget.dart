import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lil_loop/components/lil_loop/lil_loop_painter.dart';
import 'package:lil_loop/cubit/lil_loop_state.dart';

class LilLoopWidget extends StatefulWidget {
  final LilLoopState state;
  const LilLoopWidget({super.key, required this.state});

  @override
  State<LilLoopWidget> createState() => _LilLoopWidgetState();
}

class _LilLoopWidgetState extends State<LilLoopWidget> {
  late final Timer timer;
  double theta = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      setState(() {
        theta += widget.state.loopSpeed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LilLoopPainter(
        theta: theta,
        state: widget.state,
      ),
      child: Container(),
    );
  }
}
