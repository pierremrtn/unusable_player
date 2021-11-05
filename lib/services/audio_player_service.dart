import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class AudioPlayerService extends GetxService {
  static AudioPlayerService get instance => Get.find<AudioPlayerService>();

  final _player = AudioPlayer();

  up.Song? playingSong;

  Future<void> playSong(up.Song song) async {
    if (song != playingSong) {
      final uri = Uri.parse(song.uri);
      await _player.setAudioSource(AudioSource.uri(uri));
      playingSong = song;
    }
    _player.play();
  }

  Future<void> pause() async {
    _player.pause();
  }

  Future<void> setTime(Duration time) async {
    _player.seek(time);
  }

  Stream<up.Song> get songStream async* {
    //todo playlist List<{up.Song, audioSource}>
    // return _player.playbackEventStream.map((event) => playingSong!);
  }

  Stream<bool> get isPlayingStream => _player.playingStream;
  Stream<Duration> get currentTimeStream => _player.positionStream;
  Stream<double> get volumeStream => _player.volumeStream;
}
