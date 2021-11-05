import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/pages/player/models/player_control_state.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'control_background.dart';

class PlayerControl extends StatelessWidget {
  const PlayerControl({
    required this.state,
    this.onPlay,
    this.onPause,
    this.onSetTime,
    Key? key,
  }) : super(key: key);

  final PlayerControlState state;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final ValueChanged<Duration>? onSetTime;

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
                      Flexible(
                        fit: FlexFit.tight,
                        child: context.headline5(
                          _formatedCurrentTime,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontFeatures: [FontFeature.tabularFigures()],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: _buildDurationSlider(),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: context.headline5(
                          _formatedSongDuration,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFeatures: [FontFeature.tabularFigures()],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const up.Space1(),
                Row(
                  children: [
                    up.Button.icon(up.Icons.loop, onPressed: () {}),
                    up.Button.icon(up.Icons.fast_backward, onPressed: () {}),
                    Expanded(
                      child: _buildPlayButton(),
                    ),
                    up.Button.icon(up.Icons.fast_forward, onPressed: () {}),
                    up.Button.icon(up.Icons.shuffle, onPressed: () {}),
                  ],
                ),
                const up.Space1(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    context.headline3("Speaker"),
                    const up.Space3(),
                    context.subtitle2("34%"),
                  ],
                ),
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
    double max = 0;
    if (state.songDuration != null && state.currentTime != null) {
      max = state.songDuration!.inMilliseconds.toDouble();
      value = state.currentTime!.inMilliseconds / max;
    }
    return Slider(
      value: value.toDouble(),
      onChanged: onSetTime != null
          ? (value) => onSetTime!(
                Duration(
                  milliseconds: (value * max).toInt(),
                ),
              )
          : null,
    );
  }

  String get _formatedCurrentTime => state.currentTime?.display ?? "--:--";

  String get _formatedSongDuration => state.songDuration?.display ?? "--:--";
}
