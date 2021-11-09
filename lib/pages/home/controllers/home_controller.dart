import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class HomeController extends GetxController {
  HomeController({
    required this.audioPlayerService,
  });

  @override
  void onInit() {
    _isPlaying.bindStream(audioPlayerService.isPlayingStream);
    super.onInit();
  }

  final up.AudioPlayerService audioPlayerService;
  final Rx<up.Song?> _playingSong = Rx(null);
  final RxBool _isPlaying = false.obs;

  Future<void> onSelectSong(List<up.Song> songs, int index) async {
    await Get.toNamed(
      up.Routes.player,
      arguments: up.PlayerParameters(
        songs: songs[index] != audioPlayerService.playingSong ? songs : null,
        index: index,
      ),
    );
    _updatePlayingSongIndicator();
  }

  up.Song? get playingSong => _playingSong.value;
  bool get isPlaying => _isPlaying.value;

  Future<void> playingSongIndicatorPlay() async => audioPlayerService.play();
  Future<void> playingSongIndicatorPause() async => audioPlayerService.pause();

  Future<void> onPlayingSongIndicatorTap() async {
    await Get.toNamed(
      up.Routes.player,
      arguments: const up.PlayerParameters.openCurrentSong(),
    );
    _updatePlayingSongIndicator();
  }

  void _updatePlayingSongIndicator() {
    _isPlaying.value = audioPlayerService.isPlaying;
    _playingSong.value = audioPlayerService.playingSong;
  }
}
