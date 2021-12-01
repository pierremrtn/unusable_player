import 'package:get/get.dart';
import 'package:unusable_player/pages/home/controllers/search_controller.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class HomeController extends GetxController {
  HomeController({
    required this.audioPlayerService,
    required this.searchController,
  });

  @override
  void onInit() {
    _playingSong.bindStream(audioPlayerService.songStream);
    audioPlayerService.playerStateStream.listen(_onPlayerStateChange);
    super.onInit();
  }

  final up.AudioPlayerService audioPlayerService;
  final SearchController searchController;
  final Rx<up.Song?> _playingSong = Rx(null);
  final RxBool _isPlaying = false.obs;

  bool get showSearchResult => searchController.showSearchResult;
  up.Song? get playingSong => _playingSong.value;
  bool get isPlaying => _isPlaying.value;
  bool get showPlayingSongIndicator => playingSong != null;

  Future<void> search(String arg) async {
    searchController.search(arg);
  }

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

  Future<void> playingSongIndicatorPlay() async => audioPlayerService.play();
  Future<void> playingSongIndicatorPause() async => audioPlayerService.pause();
  Future<void> onPlayingSongIndicatorTap() async {
    await Get.toNamed(
      up.Routes.player,
      arguments: const up.PlayerParameters.openCurrentSong(),
    );
    _updatePlayingSongIndicator();
  }

  void _onPlayerStateChange(up.AudioPlayerState state) {
    switch (state) {
      case up.AudioPlayerState.playing:
        _isPlaying.value = true;
        break;
      case up.AudioPlayerState.paused:
        _isPlaying.value = false;
        break;
      case up.AudioPlayerState.completed:
        _playingSong.value = null;
        break;
    }
  }

  void _updatePlayingSongIndicator() {
    _isPlaying.value = audioPlayerService.isPlaying;
    _playingSong.value = audioPlayerService.playingSong;
  }
}
