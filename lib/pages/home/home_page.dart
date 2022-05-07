import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neat/neat.dart';
import 'package:animate_do/animate_do.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'controllers/home_controller.dart';
import 'widgets/home_body.dart';
import 'widgets/home_menu_button.dart';
import 'widgets/home_drawer_menu.dart';

export 'home_bindings.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: up.emptyAppBar(),
      onDrawerChanged: controller.onDrawerChanged,
      drawer: homeDrawerMenu(context),
      backgroundColor: context.colorScheme.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildPlayingIndicator(context),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            context.headline1("home_title".tr),
                            context.subtitle1("home_subtitle".tr),
                          ],
                        ),
                      ),
                      HomeMenuButton(
                        controller: controller.menuAnimation,
                      ),
                    ],
                  ),
                ),
              ),
              up.SliverPersistentSearchBar(
                onSearch: controller.search,
                focusNode: controller.searchFocusNode,
                controller: controller.searchTextEditingController,
                padding: const EdgeInsets.only(
                  top: up.Dimensions.padding3,
                  bottom: up.Dimensions.padding4,
                  left: up.Dimensions.paddingPage,
                ),
              ),
              Obx(
                () => SliverAnimatedOpacity(
                  sliver: SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: up.SliverPersistentTabBar(
                      isScrollable: false,
                      tabs: [
                        "home_songs_tab".tr,
                        "home_artists_tab".tr,
                        "home_albums_tab".tr,
                      ],
                      forceExpandSeparator: innerBoxIsScrolled,
                    ),
                  ),
                  opacity: controller.showSearchResult ? 0 : 1,
                  duration: up.Feel.animationDuration,
                  curve: up.Feel.animationCurve,
                ),
              ),
            ],
            body: Obx(() => HomeBody(
                  showSearchResults: controller.showSearchResult,
                  onSelectSong: controller.onSelectSong,
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayingIndicator(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: up.Feel.animationDuration,
        switchInCurve: up.Feel.animationCurve,
        switchOutCurve: up.Feel.animationCurve,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(
          child: child,
          scale: animation,
        ),
        child: controller.showPlayingSongIndicator
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: up.Dimensions.paddingPage -
                      up.kPlayingSongIndicatorShadowSize,
                ),
                child: BounceInUp(
                  child: up.PlayingSongIndicator(
                    song: controller.playingSong!,
                    isPlaying: controller.isPlaying,
                    onPlay: controller.playingSongIndicatorPlay,
                    onPause: controller.playingSongIndicatorPause,
                    onTap: controller.onPlayingSongIndicatorTap,
                    onDrag: controller.dismissPlayingSongIndicator,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
