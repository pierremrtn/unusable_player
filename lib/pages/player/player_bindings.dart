import 'package:get/get.dart';
import 'package:unusable_player/pages/player/player_controller.dart';

class PlayerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayerController());
  }
}
