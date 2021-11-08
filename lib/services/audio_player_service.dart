import 'dart:ffi';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class AudioPlayerService extends GetxService {
  static AudioPlayerService get instance => Get.find<AudioPlayerService>();

  final _player = AudioPlayer();

  up.Song? playingSong;

  bool get hasNext => _player.hasNext;
  bool get hasPrevious => _player.hasPrevious;
  bool get canEnableShuffleMode => false;
  bool get shuffleModeEnabled => _player.shuffleModeEnabled;
  bool get loopModeEnabled => _player.loopMode != LoopMode.off;
  bool get isPlaying => _player.playing;
  double get volume => _player.volume;
  Duration get currentTime => _player.position;

  Future<void> playSong(up.Song song) async {
    if (song != playingSong) {
      final uri = Uri.parse(song.uri);
      await _player.setAudioSource(AudioSource.uri(uri));
      playingSong = song;
    }
    //do not await
    //await will wait until the end of the song
    _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> setTime(Duration time) async {
    await _player.seek(time);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  Future<void> toggleShuffleMode() async {
    if (_player.shuffleModeEnabled) {
      await _player.setShuffleModeEnabled(true);
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

  Future<void> previous() async {
    await _player.seekToPrevious();
  }

  Future<void> next() async {
    await _player.seekToNext();
  }

  Stream<up.Song> get songStream async* {
    //todo playlist List<{up.Song, audioSource}>
    // return _player.playbackEventStream.map((event) => playingSong!);
  }

  Stream<bool> get isPlayingStream => _player.playingStream;
  Stream<Duration> get currentTimeStream => _player.positionStream;
  Stream<double> get volumeStream => _player.volumeStream;
  Stream<bool> get loopModeStream => _player.loopModeStream.map(
        (mode) => mode.enabled,
      );
  Stream<bool> get shuffleModeStream => _player.shuffleModeEnabledStream;
}

extension _IsEnabled on LoopMode {
  bool get enabled => this != LoopMode.off;
}
