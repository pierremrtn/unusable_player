import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'models/page_state.dart';
import 'models/player_control_state.dart';

class PlayerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    try {
      final args = Get.arguments;
      final song = args[0] as up.Song;
      _setDisplayedSong(song);
      _bindStreams();
    } catch (e) {
      Get.back();
    }
  }

  final Rx<up.PageState> pageState = PageState(
    displayedSong: null,
    displayPlayingSong: false,
  ).obs;
  final Rx<Duration?> currentTime = Rx(null);
  final RxDouble volume = 0.0.obs;
  final RxBool isPlaying = false.obs;

  up.Song get displayedSong => pageState.value.displayedSong!;

  PlayerControlState get controlState {
    if (pageState.value.displayPlayingSong) {
      return PlayerControlState(
        isPlaying: isPlaying.value,
        currentTime: currentTime.value,
        songDuration: pageState.value.displayedSong?.duration,
      );
    } else {
      return PlayerControlState(
        isPlaying: false,
        currentTime: null,
        songDuration: pageState.value.displayedSong?.duration,
      );
    }
  }

  Future<void> play() async {
    await up.AudioPlayerService.instance.playSong(
      pageState.value.displayedSong!,
    );
    pageState.update(
      (state) {
        state!.displayPlayingSong = true;
      },
    );
  }

  Future<void> pause() async {
    await up.AudioPlayerService.instance.pause();
  }

  Future<void> setTime(Duration time) async {
    await up.AudioPlayerService.instance.setTime(time);
  }

  void _setDisplayedSong(up.Song song) {
    pageState.update(
      (state) {
        if (state != null) {
          state.displayPlayingSong =
              song == up.AudioPlayerService.instance.playingSong;
          state.displayedSong = song;
        }
      },
    );
  }

  void _bindStreams() {
    //bind song stream, map to page state
    // pageState.bindStream(up.AudioPlayerService.instance.songStream.map())
    isPlaying.bindStream(up.AudioPlayerService.instance.isPlayingStream);
    volume.bindStream(up.AudioPlayerService.instance.volumeStream);
    currentTime.bindStream(up.AudioPlayerService.instance.currentTimeStream);
  }
}
