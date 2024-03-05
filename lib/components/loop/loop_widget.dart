import 'dart:async';
import 'package:flutter/material.dart';
import 'package:useless_app/components/loop/loop_painter.dart';
import 'package:useless_app/cubit/loop/loop_state.dart';

class LoopWidget extends StatefulWidget {
  final LoopState state;
  const LoopWidget({super.key, required this.state});

  @override
  State<LoopWidget> createState() => _LoopWidgetState();
}

class _LoopWidgetState extends State<LoopWidget> {
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
      painter: LoopPainter(
        theta: theta,
        state: widget.state,
      ),
      child: Container(),
    );
  }
}
