import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SearchController extends GetxController with StateMixin<List<up.Song>> {
  static SearchController get instance => Get.find<SearchController>();

  SearchController({
    required this.audioQueryService,
  });

  final up.AudioQueryService audioQueryService;
  final RxBool _showSearchResult = false.obs;

  bool get showSearchResult => _showSearchResult.value;

  Future<bool> leaveSearchResult() async {
    if (showSearchResult == true) {
      _showSearchResult.value = false;
      return false;
    } else {
      return true;
    }
  }

  Future<void> search(String arg) async {
    _showSearchResult.value = true;
    try {
      final songs = await audioQueryService.searchSong(arg);
      change(
        songs,
        status: songs.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    } catch (e) {
      _showSearchResult.value = false;
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
