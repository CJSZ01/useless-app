import 'dart:math';

import 'package:equatable/equatable.dart';

class MusicState extends Equatable {
  final bool isMute;
  final int song;
  final double speed;
  final bool hasInitialized;
  const MusicState(
      {required this.isMute,
      required this.song,
      required this.speed,
      required this.hasInitialized});

  MusicState.initial()
      : speed = 1.0,
        isMute = false,
        song = Random().nextInt(3),
        hasInitialized = false;

  @override
  List<Object?> get props => [isMute, song, speed, hasInitialized];

  MusicState copyWith(
      {bool? isMute, int? song, double? speed, bool? hasInitialized}) {
    return MusicState(
        isMute: isMute ?? this.isMute,
        song: song ?? this.song,
        speed: speed ?? this.speed,
        hasInitialized: hasInitialized ?? this.hasInitialized);
  }
}
