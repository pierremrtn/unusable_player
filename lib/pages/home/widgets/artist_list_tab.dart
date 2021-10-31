import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/pages/home/widgets/sliver_song_list.dart';

import 'package:unusable_player/unusable_player.dart' as up;
import 'package:unusable_player/pages/home/controllers/artists_controller.dart';
import 'home_inner_list.dart';
import 'sliver_artist_list.dart';

class ArtistListTab extends GetView<ArtistsController> {
  const ArtistListTab({
    this.onSongTap,
    Key? key,
  }) : super(key: key);

  final OnSongTap? onSongTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        transitionBuilder: _transitionBuilder,
        child: controller.showArtistSongs.value
            ? _buildAlbumSongList(context)
            : _buildAlbumList(context),
      ),
    );
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    return ScaleTransition(
      child: child,
      scale: animation,
    );
  }

  Widget _buildAlbumList(BuildContext context) {
    return HomeInnerList(
      storageKey: "home_artists",
      sliver: controller.obx(
        (List<up.Artist>? artists) => SliverArtistList(
          artists: artists ?? [],
          onSelectArtist: controller.selectArtist,
        ),
        onEmpty: up.EmptyListIndicator.sliver(),
        onLoading: up.LoadingListIndicator.sliver(),
      ),
    );
  }

  Widget _buildAlbumSongList(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.leaveArtistSongsView,
      child: HomeInnerList(
        sliver: SliverSongList(
          songs: controller.artistSongs ?? [],
          onSongTap: onSongTap,
        ),
      ),
    );
  }
}
