import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neat/neat.dart';
import 'package:animate_do/animate_do.dart';
import 'package:unusable_player/pages/home/controllers/home_controller.dart';
import 'package:unusable_player/pages/home/widgets/home_body.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'widgets/album_list_tab.dart';
import 'widgets/artist_list_tab.dart';
import 'widgets/song_list_tab.dart';

export 'home_bindings.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: up.emptyAppBar(),
      backgroundColor: context.colorScheme.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const up.Padding3.horizontal(),
        child: _buildPlayingIndicator(context),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) =>
                [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: up.Dimensions.pageMargin,
                    horizontal: up.Dimensions.pageMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      context.headline1("home_title".tr),
                      context.subtitle1("home_subtitle".tr),
                    ],
                  ),
                ),
              ),
              up.SliverPersistentSearchBar(
                onSearch: controller.search,
                padding: const EdgeInsets.only(
                  top: up.Dimensions.padding3,
                  bottom: up.Dimensions.padding4,
                  left: up.Dimensions.pageMargin,
                ),
              ),
              _buildTabBar(
                context,
                innerBoxIsScrolled,
              ),
            ],
            body: Obx(
              () => Padding(
                padding: _buildTabViewBottomPadding(),
                child: HomeBody(
                  showSearchResults: controller.showSearchResult,
                  onSelectSong: controller.onSelectSong,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(
    BuildContext context,
    bool innerBoxIsScrolled,
  ) =>
      Obx(() {
        if (controller.showSearchResult == false) {
          return SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: up.SliverPersistentTabBar(
              isScrollable: false,
              tabs: [
                "home_songs_tab".tr,
                "home_artists_tab".tr,
                "home_albums_tab".tr,
              ],
              forceExpandSeparator: innerBoxIsScrolled,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        }
      });

  EdgeInsetsGeometry _buildTabViewBottomPadding() =>
      controller.showPlayingSongIndicator
          ? const EdgeInsets.only(
              bottom:
                  up.kPlayingSongIndicatorHeight + kFloatingActionButtonMargin,
            )
          : EdgeInsets.zero;

  Widget _buildPlayingIndicator(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: up.Feel.animationDuration,
        switchInCurve: up.Feel.animationCurve,
        switchOutCurve: up.Feel.animationCurve,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
        ) =>
            ScaleTransition(
          child: child,
          scale: animation,
        ),
        child: controller.showPlayingSongIndicator
            ? BounceInUp(
                child: up.PlayingSongIndicator(
                  song: controller.playingSong!,
                  isPlaying: controller.isPlaying,
                  onPlay: controller.playingSongIndicatorPlay,
                  onPause: controller.playingSongIndicatorPause,
                  onTap: controller.onPlayingSongIndicatorTap,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
