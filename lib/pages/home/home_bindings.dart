import 'package:get/get.dart';
import 'loaders/audio_files_loader.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioFilesLoader());
  }
}
