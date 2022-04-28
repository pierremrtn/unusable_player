import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

//TODO: fallback artworks
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
      bottomColor: album.artwork?.dominantColor,
      onTap: onTap,
      bottomHorizontalPadding: up.Dimensions.space5,
      padding: const EdgeInsets.all(up.Dimensions.space5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: up.Image.h2(
              album.artwork?.image ??
                  const AssetImage("assets/artwork_not_found.jpg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: up.Dimensions.space5,
              vertical: up.Dimensions.space4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: context.bodyText2(
                      album.artist.name,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const up.Space5.w(),
                    Flexible(
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
