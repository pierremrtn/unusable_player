import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'player_controller.dart';

class PlayerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PlayerController(
        audioService: up.AudioPlayerService.instance,
      ),
    );
  }
}
