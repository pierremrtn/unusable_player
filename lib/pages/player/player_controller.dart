import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'models/player_state.dart' as up;

class PlayerController extends GetxController with StateMixin<up.PlayerState> {
  @override
  void onInit() {
    super.onInit();
    try {
      final args = Get.arguments;
      _songParam = args[0] as up.Song;
      change(_buildState(), status: RxStatus.success());
    } catch (e) {
      change(_buildState(), status: RxStatus.error());
      Get.back();
    }
  }

  up.Song? _songParam;

  Future<void> play(up.Song song) async {
    await up.AudioPlayerService.instance.playSong(song);
    change(_buildState());
  }

  Future<void> pause() async {
    await up.AudioPlayerService.instance.pause();
    change(_buildState());
  }

  up.PlayerState _buildState() {
    final displayPlayingSong =
        _songParam == up.AudioPlayerService.instance.playingSong;
    return up.PlayerState(
      displayedSong: _songParam,
      displayPlayingSong: displayPlayingSong,
      isPlaying:
          displayPlayingSong ? up.AudioPlayerService.instance.isPlaying : false,
    );
  }
}
