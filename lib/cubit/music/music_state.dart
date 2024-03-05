import 'dart:math';

import 'package:equatable/equatable.dart';

class MusicState extends Equatable {
  final bool isMute;
  final int song;
  final double speed;
  const MusicState(
      {required this.isMute, required this.song, required this.speed});

  MusicState.initial()
      : speed = 1.0,
        isMute = false,
        song = Random().nextInt(3);

  @override
  List<Object?> get props => [isMute, song, speed];

  MusicState copyWith({
    bool? isMute,
    int? song,
    double? speed,
  }) {
    return MusicState(
      isMute: isMute ?? this.isMute,
      song: song ?? this.song,
      speed: speed ?? this.speed,
    );
  }
}
