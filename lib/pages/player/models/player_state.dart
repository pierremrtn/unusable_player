import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unusable_player/models/song.dart';

part 'player_state.freezed.dart';

@freezed
class PlayerState with _$PlayerState {
  const PlayerState._();

  const factory PlayerState({
    Song? displayedSong,
    @Default(false) bool displayPlayingSong,
    @Default(false) bool isPlaying,
  }) = _PlayerState;
}
