import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'package:unusable_player/pages/player/models/player_control_state.dart';
import 'control_background.dart';

class PlayerControl extends StatelessWidget {
  const PlayerControl({
    required this.state,
    this.onPlay,
    this.onPause,
    this.onSetTime,
    this.onSetVolume,
    this.onToggleLoopMode,
    this.onToggleShuffleMode,
    this.onNext,
    this.onPrevious,
    Key? key,
  }) : super(key: key);

  final PlayerControlState state;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final ValueChanged<Duration>? onSetTime;
  final ValueChanged<double>? onSetVolume;
  final VoidCallback? onToggleLoopMode;
  final VoidCallback? onToggleShuffleMode;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: ControlBackground(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: up.Dimensions.space4),
          child: up.DoubleBottomCard(
            padding: const EdgeInsets.symmetric(vertical: up.Dimensions.space3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: up.Dimensions.space3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.headline5(
                        _formattedCurrentTime,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
                      ),
                      const Spacer(),
                      context.headline5(
                        _formattedSongDuration,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
                      ),
                    ],
                  ),
                ),
                _buildDurationSlider(),
                const up.Space1(),
                Row(
                  children: [
                    up.Button.icon(
                      up.Icons.loop,
                      onPressed: onToggleLoopMode,
                      color: state.loopModeEnabled
                          ? context.colorScheme.secondary
                          : context.colorScheme.onSurface,
                    ),
                    up.Button.icon(
                      up.Icons.fast_backward,
                      onPressed: onPrevious,
                      enabled: state.previousSongButtonEnabled,
                    ),
                    Expanded(
                      child: _buildPlayButton(),
                    ),
                    up.Button.icon(
                      up.Icons.fast_forward,
                      onPressed: onNext,
                      enabled: state.nextSongButtonEnabled,
                    ),
                    up.Button.icon(
                      up.Icons.shuffle,
                      enabled: state.canEnableShuffleMode,
                      onPressed: onToggleShuffleMode,
                      color: state.shuffleModeEnabled
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurface,
                    ),
                  ],
                ),
                const up.Space1(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: up.Dimensions.space3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.headline5("Speaker"),
                      const Spacer(),
                      context.headline5(
                        _formattedVolume,
                        style: TextStyle(
                          color: context.colorScheme.onSurface,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ],
                  ),
                ),
                _buildVolumeSlider(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayButton() {
    return up.Button.round(
      onPressed: state.isPlaying ? onPause : onPlay,
      icon: state.isPlaying ? up.Icons.pause : up.Icons.play,
      style: up.ButtonStyle.secondary,
      padding: const EdgeInsets.all(up.Dimensions.space4),
    );
  }

  Widget _buildDurationSlider() {
    double value = 0;
    double totalDurationMS = 0;
    if (state.songDuration != null && state.currentTime != null) {
      totalDurationMS = state.songDuration!.inMilliseconds.toDouble();
      value = state.currentTime!.inMilliseconds / totalDurationMS;
      value = value.clamp(0, 1);
    }
    return up.JigglingSlider(
      value: value,
      onChanged: onSetTime != null
          ? (value) => onSetTime!(
                Duration(
                  milliseconds: (value * totalDurationMS).toInt(),
                ),
              )
          : null,
    );
  }

  Widget _buildVolumeSlider() {
    return up.JigglingSlider(
      value: state.volume,
      onChanged: onSetVolume,
    );
  }

  String get _formattedCurrentTime => state.currentTime?.display ?? "--:--";

  String get _formattedSongDuration => state.songDuration?.display ?? "--:--";

  String get _formattedVolume =>
      (100 * state.volume).toInt().toString().padLeft(3, " ") + "%";
}
