import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class HomeController extends GetxController {
  HomeController({
    required this.audioPlayerService,
  });

  @override
  void onInit() {
    //TODO: bind to song stream;
    // _playingSong.bindStream(audioPlayerService.songStream);
    _isPlaying.bindStream(audioPlayerService.isPlayingStream);
    super.onInit();
  }

  final up.AudioPlayerService audioPlayerService;
  final Rx<up.Song?> _playingSong = Rx(null);
  final RxBool _isPlaying = false.obs;

  Future<void> onSongTap(up.Song song) async {
    await Get.toNamed(up.Routes.player, arguments: [song]);
    _updatePlayingSongIndicator();
  }

  up.Song? get playingSong => _playingSong.value;
  bool get isPlaying => _isPlaying.value;

  Future<void> playingSongIndicatorPlay() async =>
      audioPlayerService.playSong(audioPlayerService.playingSong!);

  Future<void> playingSongIndicatorPause() async => audioPlayerService.pause();

  Future<void> onPlayingSongIndicatorTap() async {
    await Get.toNamed(up.Routes.player, arguments: [playingSong]);
    _updatePlayingSongIndicator();
  }

  void _updatePlayingSongIndicator() {
    _isPlaying.value = audioPlayerService.isPlaying;
    _playingSong.value = audioPlayerService.playingSong;
  }
}
