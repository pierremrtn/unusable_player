import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unusable_player/unusable_player.dart' as up;
import 'package:unusable_player/pages/home/controllers/albums_controller.dart';
import '../home_inner_list.dart';
import 'sliver_album_list.dart';

class AlbumListTab extends GetView<AlbumsController> {
  const AlbumListTab();

  @override
  Widget build(BuildContext context) {
    return HomeInnerList(
      storageKey: "home_albums",
      sliver: controller.obx(
        (List<up.Album>? albums) => SliverAlbumList(
          albums: albums ?? [],
        ),
        onEmpty: up.EmptyListIndicator.sliver(),
        onLoading: up.LoadingListIndicator.sliver(),
      ),
    );
  }
}
