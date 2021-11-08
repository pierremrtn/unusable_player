import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'models/player_control_state.dart';

class PlayerController extends GetxController
    with StateMixin<PlayerControlState> {
  PlayerController({
    required this.audioService,
  });

  @override
  void onInit() {
    super.onInit();
    try {
      final args = Get.arguments;
      _song.value = args[0] as up.Song;
      _bindStreams();
      play();
    } catch (e) {
      Get.back();
    }
  }

  final up.AudioPlayerService audioService;
  final Rx<up.Song?> _song = Rx(null);

  up.Song get song => _song.value!;

  Future<void> play() async => audioService.playSong(song);
  Future<void> pause() async => audioService.pause();
  Future<void> setTime(Duration time) async => audioService.setTime(time);
  Future<void> setVolume(double volume) async => audioService.setVolume(volume);
  Future<void> toggleShuffleMode() async => audioService.toggleShuffleMode();
  Future<void> toggleLoopMode() async => audioService.toggleLoopMode();
  Future<void> previous() async => audioService.previous();
  Future<void> next() async => audioService.next();

  void _bindStreams() {
    //bind song stream, map to page state
    // pageState.bindStream(audioService.songStream.map())
    audioService.isPlayingStream.listen((_) => _updateControlState());
    audioService.volumeStream.listen((_) => _updateControlState());
    audioService.currentTimeStream.listen((_) => _updateControlState());
    audioService.loopModeStream.listen((_) => _updateControlState());
    audioService.shuffleModeStream.listen((_) => _updateControlState());
  }

  void _updateControlState() {
    change(_controlState, status: RxStatus.success());
  }

  PlayerControlState get _controlState => PlayerControlState(
        isPlaying: audioService.isPlaying,
        currentTime: audioService.currentTime,
        songDuration: _song.value?.duration,
        nextSongButtonEnabled: audioService.hasPrevious,
        previousSongButtonEnabled: audioService.hasNext,
        loopModeEnabled: audioService.loopModeEnabled,
        canEnableShuffleMode: audioService.canEnableShuffleMode,
        shuffleModeEnabled: audioService.shuffleModeEnabled,
        volume: audioService.volume,
      );
}
