import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:unusable_player/unusable_player.dart' as up;

//TODO: redesign card

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    required this.album,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final up.Album album;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      onTap: onTap,
      bottomHorizontalPadding: up.Dimensions.space5,
      padding: const EdgeInsets.all(up.Dimensions.space5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          up.Image.h2(
            album.artwork != null
                ? MemoryImage(album.artwork!) as ImageProvider<Object>
                : const AssetImage("assets/skeler.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: up.Dimensions.space5,
              vertical: up.Dimensions.space4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: context.bodyText2(album.artist.name)),
                    const up.Space5.w(),
                    Expanded(
                      child: context.bodyText2(
                        "song_number".trPluralParams(
                          "song_number_plural",
                          album.songNumber,
                          {"number": album.songNumber.toString()},
                        ),
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
                const up.Space5(),
                context.headline4(
                  album.title,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}