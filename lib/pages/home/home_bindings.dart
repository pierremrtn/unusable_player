import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart';
import 'controllers/songs_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SongsController(
        audioQueryService: AudioQueryService.instance,
      ),
    );
  }
}
