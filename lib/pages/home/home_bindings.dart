import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'controllers/home_controller.dart';
import 'controllers/songs_controller.dart';
import 'controllers/albums_controller.dart';
import 'controllers/artists_controller.dart';
import 'controllers/search_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SearchController(
        audioQueryService: up.AudioQueryService.instance,
      ),
    );
    Get.put(
      HomeController(
        audioPlayerService: up.AudioPlayerService.instance,
        searchController: SearchController.instance,
      ),
    );
    Get.lazyPut(
      () => SongsController(
        audioQueryService: up.AudioQueryService.instance,
      ),
    );
    Get.lazyPut(
      () => AlbumsController(
        audioQueryService: up.AudioQueryService.instance,
      ),
    );
    Get.lazyPut(
      () => ArtistsController(
        audioQueryService: up.AudioQueryService.instance,
      ),
    );
  }
}
