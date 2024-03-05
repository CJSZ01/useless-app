import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:useless_app/cubit/music/music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final AudioPlayer _player;
  MusicCubit({required AudioPlayer player})
      : _player = player,
        super(
          MusicState.initial(),
        );

  Future<void> initializeAudio() async {
    await _player.setAsset('assets/audio/bg${state.song}.mp3');
    _player.setVolume(1.0);
    _player.setLoopMode(LoopMode.one);
    _player.play();
  }

  void updateState({double? loopSpeed, int? song, bool? isMute}) async {
    emit(state.copyWith(
        speed: 1.0 + (loopSpeed ?? 0), song: song, isMute: isMute));
    if (loopSpeed != null) {
      _player.setSpeed(state.speed);
    }
    if (isMute != null) {
      _player.setVolume(isMute ? 0 : 1.0);
    }
    if (song != null) {
      await _player.setAsset('assets/audio/bg${state.song}.mp3');
    }
  }
}
