import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SongsController extends GetxController with StateMixin<List<up.Song>> {
  SongsController({
    required this.audioQueryService,
  });

  @override
  void onInit() {
    super.onInit();
    _querySongs();
  }

  final up.AudioQueryService audioQueryService;

  Future<void> _querySongs() async {
    try {
      final songs = await audioQueryService.querySongs();
      change(
        songs,
        status: songs.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
