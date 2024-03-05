import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:useless_app/cubit/loop/loop_cubit.dart';
import 'package:useless_app/cubit/music/music_cubit.dart';
import 'package:useless_app/loop_page.dart';

class UselessApp extends StatelessWidget {
  const UselessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoopCubit(),
          ),
          BlocProvider(
            create: (context) => MusicCubit(
              player: AudioPlayer(),
            ),
          )
        ],
        child: const LoopPage(),
      ),
    );
  }
}
