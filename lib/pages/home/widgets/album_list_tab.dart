import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/pages/home/widgets/sliver_song_list.dart';

import 'package:unusable_player/unusable_player.dart' as up;
import 'package:unusable_player/pages/home/controllers/albums_controller.dart';
import 'home_inner_list.dart';
import 'sliver_album_list.dart';

class AlbumListTab extends GetView<AlbumsController> {
  const AlbumListTab({
    this.onSongTap,
    Key? key,
  }) : super(key: key);

  final OnSongTap? onSongTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: up.Feel.animationDuration,
        switchInCurve: up.Feel.animationCurve,
        switchOutCurve: up.Feel.animationCurve,
        transitionBuilder: _transitionBuilder,
        child: controller.showAlbumSongs.value
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
      storageKey: "home_albums",
      sliver: controller.obx(
        (List<up.Album>? albums) => SliverAlbumList(
          albums: albums ?? [],
          onSelectAlbum: controller.selectAlbum,
        ),
        onEmpty: up.EmptyListIndicator.sliver(),
        onLoading: up.LoadingListIndicator.sliver(),
      ),
    );
  }

  Widget _buildAlbumSongList(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.leaveAlbumView,
      child: HomeInnerList(
        sliver: SliverSongList(
          songs: controller.albumSongs ?? [],
          onSongTap: onSongTap,
        ),
      ),
    );
  }
}
