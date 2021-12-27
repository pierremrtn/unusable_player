import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SearchController extends GetxController with StateMixin<List<up.Song>> {
  static SearchController get instance => Get.find<SearchController>();

  SearchController({
    required this.audioQueryService,
  });

  final up.AudioQueryService audioQueryService;
  final RxBool _showSearchResult = false.obs;
  final TextEditingController controller = TextEditingController(text: "");
  final FocusNode focus = FocusNode();

  bool get showSearchResult => _showSearchResult.value;

  Future<bool> leaveSearchResult() async {
    if (showSearchResult == true) {
      _showSearchResult.value = false;
      controller.clear();
      focus.unfocus();
      return false;
    } else {
      return true;
    }
  }

  void search(String arg) {
    change([], status: RxStatus.loading());
    _showSearchResult.value = true;

    audioQueryService.searchSong(arg).listen((song) {
      final List<up.Song> songs = List.from(state ?? [])..add(song);
      change(
        songs,
        status: songs.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    }, onDone: () {
      change(
        state,
        status:
            (state?.isEmpty ?? true) ? RxStatus.empty() : RxStatus.success(),
      );
    }, onError: (e) {
      _showSearchResult.value = false;
      change([], status: RxStatus.error(e.toString()));
    });
  }

  @override
  void onClose() {
    controller.dispose();
  }
}
