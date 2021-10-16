import 'package:get/get.dart';
import 'controllers/songs_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SongsController());
  }
}
