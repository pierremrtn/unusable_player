import 'package:get/instance_manager.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => up.AudioFilesLoader());
  }
}
