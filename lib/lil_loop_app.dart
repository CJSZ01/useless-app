import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lil_loop/cubit/lil_loop_cubit.dart';
import 'package:lil_loop/lil_loop_page.dart';

class LilLoopApp extends StatelessWidget {
  const LilLoopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<LilLoopCubit>(
        create: (context) => LilLoopCubit(),
        child: const LilLoopPage(),
      ),
    );
  }
}
