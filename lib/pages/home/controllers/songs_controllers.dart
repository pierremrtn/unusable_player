import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class SongsController extends GetxController with StateMixin<List<up.Song>> {
  @override
  void onInit() {
    super.onInit();
    _ensurePermissionGranted().then(
      (_) => _queryAudioFiles(),
    );
  }

  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<void> _ensurePermissionGranted() async {
    while (await _audioQuery.permissionsStatus() == false) {
      await _audioQuery.permissionsRequest();
    }
  }

  Future<void> _queryAudioFiles() async {
    try {
      final songs = await up.AudioQueryService.find.querySongs();
      change(
        songs,
        status: songs.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
