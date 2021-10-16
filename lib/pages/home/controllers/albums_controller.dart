import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class AlbumsController extends GetxController with StateMixin<List<up.Album>> {
  AlbumsController({
    required this.audioQueryService,
  });

  @override
  void onInit() {
    super.onInit();
    _queryAlbums();
  }

  final up.AudioQueryService audioQueryService;

  Future<void> _queryAlbums() async {
    try {
      final albums = await audioQueryService.queryAlbums();
      change(
        albums,
        status: albums.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
