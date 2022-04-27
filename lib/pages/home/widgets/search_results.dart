import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'package:unusable_player/pages/home/controllers/search_controller.dart';
import 'sliver_song_list.dart';

class SearchResults extends GetView<SearchController> {
  SearchResults({
    this.onSelectSong,
    Key? key,
  }) : super(key: key);

  final SelectSongCallback? onSelectSong;
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.leaveSearchResult,
      child: Padding(
        padding: const EdgeInsets.only(
          left: up.Dimensions.pageMargin,
          right: up.Dimensions.pageMargin,
          top: up.Dimensions.pageMargin,
        ),
        child: controller.obx(
          (songs) => ListView.builder(
            itemCount: songs?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: up.TiedSongCard(
                  random: _random,
                  song: songs![index],
                  onTap: onSelectSong != null
                      ? () => onSelectSong!(songs, index)
                      : null,
                ),
              );
            },
          ),
          onEmpty: const up.EmptyListIndicator(
            message: "Nothing found",
          ),
          onLoading: const up.LoadingListIndicator(),
        ),
      ),
    );
  }
}
