class PlayerControlState {
  const PlayerControlState({
    required this.songDuration,
    required this.currentTime,
    required this.isPlaying,
  });
  final Duration? songDuration;
  final Duration? currentTime;
  final bool isPlaying;
}
