import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class HomeController extends GetxController {
  void onSongTap(up.Song song) {
    Get.toNamed(up.Routes.player, arguments: [song]);
  }
}
