import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:unusable_player/unusable_player.dart' as up;

export '../pages/player/models/player_state.dart';

class AudioPlayerService extends GetxService {
  static AudioPlayerService get instance => Get.find<AudioPlayerService>();

  final _player = AudioPlayer();

  up.Song? playingSong;
  bool isPlaying = false;

  Future<void> playSong(up.Song song) async {
    if (song != playingSong) {
      final uri = Uri.parse(song.uri);
      await _player.setAudioSource(AudioSource.uri(uri));
      playingSong = song;
    }
    _player.play();
    isPlaying = true;
  }

  Future<void> pause() async {
    _player.pause();
    isPlaying = false;
  }
}
