import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:collection/collection.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:unusable_player/unusable_player.dart' as up;

enum AudioPlayerState {
  playing,
  paused,
  completed,
}

class AudioPlayerService extends GetxService {
  static AudioPlayerService get instance => Get.find<AudioPlayerService>();

  final _player = AudioPlayer();

  final List<up.Song> _songs = [];

  up.Song? get playingSong {
    if (_songs.isNotEmpty) {
      if (_player.currentIndex != null) {
        return _songs[_player.currentIndex!];
      } else {
        return _songs.first;
      }
    }
    return null;
  }

  up.Song? get previousSong {
    try {
      return _songs[_player.previousIndex!];
    } catch (_) {
      return null;
    }
  }

  up.Song? get nextSong {
    try {
      return _songs[_player.nextIndex!];
    } catch (_) {
      return null;
    }
  }

  AudioPlayerState get playerState => _player.playerState.toAudioPlayerState();
  bool get hasNext => _player.hasNext;
  bool get hasPrevious => _player.hasPrevious;
  bool get canEnableShuffleMode => _songs.length > 1;
  bool get shuffleModeEnabled => _player.shuffleModeEnabled;
  bool get loopModeEnabled => _player.loopMode != LoopMode.off;
  bool get isPlaying => _player.playing;
  double get volume => _player.volume;
  Duration get currentTime => _player.position;
  List<up.Song> get songList => _songs;
  int get currentSongIndex => _player.currentIndex ?? 0;
  int get previousSongIndex => _player.previousIndex ?? 0;
  int get nextSongIndex => _player.nextIndex ?? 0;

  Future<void> clear() async {
    _songs.clear();
    return _player.stop();
  }

  Future<void> setSong(up.Song song) async {
    if (!_songs.equals([song])) {
      _songs.clear();
      _songs.addAll([song]);
      final uri = Uri.parse(song.uri);
      await _player.setAudioSource(AudioSource.uri(uri));
    }
  }

  Future<void> setSongsList(List<up.Song> songs, [int? index]) async {
    if (index != _player.currentIndex || !_songs.equals(songs)) {
      _songs.clear();
      _songs.addAll(songs);
      await _player.setAudioSource(
        ConcatenatingAudioSource(
          children: songs.map(
            (song) {
              final uri = Uri.parse(song.uri);
              return AudioSource.uri(uri);
            },
          ).toList(),
        ),
        initialIndex: index,
      );
    }
  }

  Future<void> play() async => _player.play();
  Future<void> pause() async => _player.pause();
  Future<void> setTime(Duration time) async => _player.seek(time);
  Future<void> setVolume(double volume) async => _player.setVolume(volume);
  Future<void> previous() async => _player.seekToPrevious();
  Future<void> next() async => _player.seekToNext();

  Future<void> toggleShuffleMode() async {
    if (_player.shuffleModeEnabled) {
      await _player.setShuffleModeEnabled(false);
    } else {
      await _player.setShuffleModeEnabled(false);
    }
  }

  Future<void> toggleLoopMode() async {
    if (_player.loopMode == LoopMode.off) {
      await _player.setLoopMode(LoopMode.all);
    } else {
      await _player.setLoopMode(LoopMode.off);
    }
  }

  Stream<AudioPlayerState> get playerStateStream =>
      _player.playerStateStream.map((state) => state.toAudioPlayerState());
  Stream<up.Song?> get songStream =>
      _player.currentIndexStream.map((_) => playingSong);
  Stream<Duration> get currentTimeStream => _player.positionStream;
  Stream<double> get volumeStream => _player.volumeStream;
  Stream<bool> get loopModeStream =>
      _player.loopModeStream.map((mode) => mode.enabled);
  Stream<bool> get shuffleModeStream => _player.shuffleModeEnabledStream;
}

extension _IsEnabled on LoopMode {
  bool get enabled => this != LoopMode.off;
}

extension _ToAudioPlayerState on PlayerState {
  AudioPlayerState toAudioPlayerState() {
    switch (processingState) {
      case ProcessingState.completed:
        return AudioPlayerState.completed;
      default:
        return playing ? AudioPlayerState.playing : AudioPlayerState.paused;
    }
  }
}
