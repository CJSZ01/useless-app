import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useless_app/components/loop/loop_widget.dart';
import 'package:useless_app/components/loop_bottom_sheet.dart';
import 'package:useless_app/cubit/loop/loop_cubit.dart';
import 'package:useless_app/cubit/loop/loop_state.dart';
import 'package:useless_app/cubit/music/music_cubit.dart';
import 'package:useless_app/cubit/music/music_state.dart';
import 'package:useless_app/utils/loop_color_types_enum.dart';

class LoopPage extends StatefulWidget {
  const LoopPage({super.key});

  @override
  State<LoopPage> createState() => _LoopPageState();
}

class _LoopPageState extends State<LoopPage> {
  late final LoopCubit _loopCubit;
  late final MusicCubit _musicCubit;
  final DraggableScrollableController _bottomSheetController =
      DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _loopCubit = context.read<LoopCubit>();
    _musicCubit = context.read<MusicCubit>();
    _musicCubit.initializeAudio();
    _loopCubit.reset();
  }

  void onColorSelected(LoopColorTypes colorType, Color color) {
    switch (colorType) {
      case LoopColorTypes.background:
        {
          _loopCubit.updateState(backgroundColor: color);
        }
        break;
      case LoopColorTypes.foreground:
        {
          _loopCubit.updateState(foregroundColor: color);
        }
    }
  }

  void onLoopSpeedChanged(double loopSpeed) {
    _loopCubit.updateState(loopSpeed: loopSpeed);
    _musicCubit.updateState(loopSpeed: loopSpeed);
  }

  void onLoopAngleChanged(double loopAngle) {
    _loopCubit.updateState(loopAngle: loopAngle);
  }

  void onLoopStepChanged(double loopStep) {
    _loopCubit.updateState(loopStep: loopStep);
  }

  void onMute(isMute) {
    _musicCubit.updateState(isMute: !isMute);
  }

  void onSongChange(song) {
    _musicCubit.updateState(song: song);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoopCubit, LoopState>(
      bloc: _loopCubit,
      builder: (context, loopState) {
        return Scaffold(
          backgroundColor: loopState.backgroundColor,
          bottomSheet: BlocBuilder<MusicCubit, MusicState>(
              bloc: _musicCubit,
              builder: (context, musicState) {
                return LoopBottomSheet(
                  controller: _bottomSheetController,
                  onReset: _loopCubit.reset,
                  state: loopState,
                  onColorSelected: onColorSelected,
                  onLoopSpeedChanged: onLoopSpeedChanged,
                  onLoopAngleChanged: onLoopAngleChanged,
                  onLoopStepChanged: onLoopStepChanged,
                  isMute: musicState.isMute,
                  onMute: () => onMute(musicState.isMute),
                  onSongChanged: onSongChange,
                  selectedSong: musicState.song,
                  selectedColor: loopState.foregroundColor,
                );
              }),
          body: Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => _bottomSheetController.animateTo(
                    0.09,
                    duration: const Duration(milliseconds: 50),
                    curve: Curves.easeInOut,
                  ),
                  child: LoopWidget(
                    state: loopState,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'images/logo.png',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
