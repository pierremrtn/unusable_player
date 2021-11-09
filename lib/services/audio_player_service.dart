import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:unusable_player/unusable_player.dart' as up;

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

  bool get hasNext => _player.hasNext;
  bool get hasPrevious => _player.hasPrevious;
  bool get canEnableShuffleMode => false;
  bool get shuffleModeEnabled => _player.shuffleModeEnabled;
  bool get loopModeEnabled => _player.loopMode != LoopMode.off;
  bool get isPlaying => _player.playing;
  double get volume => _player.volume;
  Duration get currentTime => _player.position;

  Future<void> setSong(up.Song song) async {
    _songs.clear();
    _songs.addAll([song]);
    final uri = Uri.parse(song.uri);
    await _player.setAudioSource(AudioSource.uri(uri));
  }

  Future<void> setSongsList(List<up.Song> songs, [int? index]) async {
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

  Future<void> play() async => _player.play();
  Future<void> pause() async => _player.pause();
  Future<void> setTime(Duration time) async => _player.seek(time);
  Future<void> setVolume(double volume) async => _player.setVolume(volume);
  Future<void> previous() async => _player.seekToPrevious();
  Future<void> next() async => _player.seekToNext();

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

  Stream<up.Song?> get songStream => _player.currentIndexStream.map(
        (_) => playingSong,
      );
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
