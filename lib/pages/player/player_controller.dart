import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class PlayerController extends GetxController with StateMixin<up.Song> {
  @override
  void onInit() {
    super.onInit();
    try {
      final args = Get.arguments;
      final song = args[0] as up.Song;
      change(song, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
      Get.back();
    }
  }
}
