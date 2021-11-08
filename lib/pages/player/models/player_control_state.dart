class PlayerControlState {
  const PlayerControlState({
    required this.songDuration,
    required this.currentTime,
    required this.isPlaying,
    required this.nextSongButtonEnabled,
    required this.previousSongButtonEnabled,
    required this.loopModeEnabled,
    required this.canEnableShuffleMode,
    required this.shuffleModeEnabled,
    required this.volume,
  });
  final Duration? songDuration;
  final Duration? currentTime;
  final bool isPlaying;
  final bool nextSongButtonEnabled;
  final bool previousSongButtonEnabled;
  final bool loopModeEnabled;
  final bool canEnableShuffleMode;
  final bool shuffleModeEnabled;
  final double volume;
}
