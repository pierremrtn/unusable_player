import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:unusable_player/pages/player/models/player_parameters.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'models/player_control_state.dart';
import 'widgets/cover/cover.dart';

class PlayerController extends GetxController
    with StateMixin<PlayerControlState>, GetSingleTickerProviderStateMixin {
  PlayerController({
    required this.audioService,
  });

  @override
  void onInit() {
    final params = Get.arguments as PlayerParameters;
    _initCover(params);
    _bindStreams();
    super.onInit();
  }

  @override
  void onReady() {
    try {
      final params = Get.arguments as PlayerParameters;
      _initPlayer(params);
    } catch (e) {
      Get.back();
    }
  }

  final up.AudioPlayerService audioService;
  final Rx<up.Song?> _song = Rx(null);
  late CoverController coverController;
  late List<Uint8List?> _artworkList;
  int _currentArtworkIndex = 0;

  up.Song? get song => _song.value;

  Uint8List? get artwork => _artworkList[_currentArtworkIndex];
  Uint8List? get prevArtwork {
    if (_currentArtworkIndex - 1 >= 0) {
      return _artworkList[_currentArtworkIndex - 1];
    }
    return null;
  }

  Uint8List? get nextArtwork {
    if (_currentArtworkIndex + 1 < _artworkList.length) {
      return _artworkList[_currentArtworkIndex + 1];
    }
    return null;
  }

  Future<void> play() async => audioService.play();
  Future<void> pause() async => audioService.pause();
  Future<void> setTime(Duration time) async => audioService.setTime(time);
  Future<void> setVolume(double volume) async => audioService.setVolume(volume);
  Future<void> toggleShuffleMode() async => audioService.toggleShuffleMode();
  Future<void> toggleLoopMode() async => audioService.toggleLoopMode();
  Future<void> previous() async => audioService.previous();
  Future<void> next() async => audioService.next();

  void _initCover(PlayerParameters params) {
    bool? showPrev;
    bool? showNext;

    if (!params.openCurrentSong) {
      _currentArtworkIndex = params.index!;
      _artworkList = params.songs?.map((s) => s.artwork).toList() ?? [];
      showPrev = params.index! > 0;
      showNext = params.index! < params.songs!.length - 1;
    } else {
      _currentArtworkIndex = audioService.currentSongIndex;
      _artworkList = audioService.songList.map((s) => s.artwork).toList();
      showPrev = audioService.hasPrevious;
      showNext = audioService.hasNext;
    }
    coverController = CoverController(
      artwork: artwork,
      prevArtwork: prevArtwork,
      nextArtwork: nextArtwork,
      onNext: next,
      onPrev: previous,
      vsync: this,
    );
  }

  Future<void> _initPlayer(PlayerParameters params) async {
    if (params.openCurrentSong) {
      _song.value = audioService.playingSong;
    } else {
      await audioService.setSongsList(params.songs!, params.index);
      play();
    }
  }

  void _bindStreams() {
    _song.bindStream(audioService.songStream);
    audioService.songStream.listen((_) => _onSongChange());
    audioService.playerStateStream.listen((_) => _updateControlState());
    audioService.volumeStream.listen((_) => _updateControlState());
    audioService.currentTimeStream.listen((_) => _updateControlState());
    audioService.loopModeStream.listen((_) => _updateControlState());
    audioService.shuffleModeStream.listen((_) => _updateControlState());
  }

  void _onSongChange() {
    _updateCover();
    _updateControlState();
  }

  Future<void> _updateCover() async {
    final idx = audioService.currentSongIndex;
    CoverAnimation animate = CoverAnimation.none;
    if (idx < _currentArtworkIndex) {
      animate = CoverAnimation.up;
    } else if (idx > _currentArtworkIndex) {
      animate = CoverAnimation.down;
    }
    _currentArtworkIndex = idx;
    coverController.setArtworks(
      animate,
      artwork: artwork,
      prevArtwork: prevArtwork,
      nextArtwork: nextArtwork,
    );
  }

  void _updateControlState() {
    change(_controlState, status: RxStatus.success());
  }

  PlayerControlState get _controlState => PlayerControlState(
        isPlaying: audioService.isPlaying,
        currentTime: audioService.currentTime,
        songDuration: _song.value?.duration,
        nextSongButtonEnabled: audioService.hasNext,
        previousSongButtonEnabled: audioService.hasPrevious,
        loopModeEnabled: audioService.loopModeEnabled,
        canEnableShuffleMode: audioService.canEnableShuffleMode,
        shuffleModeEnabled: audioService.shuffleModeEnabled,
        volume: audioService.volume,
      );
}
