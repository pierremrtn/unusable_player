import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;
import 'package:get/get.dart';

class UIKit extends StatelessWidget {
  const UIKit();

  @override
  Widget build(BuildContext context) {
    return up.Page(
      appBar: up.NormalAppBar(
        title: "UI Kit",
        onBack: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          up.Space1(),
          ...songCards,
          Divider(height: up.Dimensions.space1),
          ...playlistCards,
          Divider(height: up.Dimensions.space1),
          ...searchBars,
          Divider(height: up.Dimensions.space1),
          ...tabs,
          Divider(height: up.Dimensions.space1),
          ...texts,
          Divider(height: up.Dimensions.space1),
          icons,
          Divider(height: up.Dimensions.space1),
          ...cards,
          Divider(height: up.Dimensions.space1),
          ...buttons,
        ],
      ),
    );
  }

  get texts => [
        Headline1("Healdine 1"),
        Headline2("Headline 2"),
        Headline3("Headline 3"),
        Headline4("Headline 4"),
        Headline5("Headline 5"),
        Subtitle1("Subtitle 1"),
        Subtitle2("Subtitle 2"),
        BodyText1("BodyText 1"),
      ];

  get icons => Wrap(
        children: [
          Icon(up.Icons.search),
          Icon(up.Icons.library_music),
          Icon(up.Icons.queue_music),
          Icon(up.Icons.play_circle_filled),
          Icon(up.Icons.fast_backward),
          Icon(up.Icons.fast_forward),
          Icon(up.Icons.stop),
          Icon(up.Icons.play),
          Icon(up.Icons.to_end),
          Icon(up.Icons.to_start),
          Icon(up.Icons.headset),
          Icon(up.Icons.heart_1),
          Icon(up.Icons.heart_empty),
          Icon(up.Icons.home),
          Icon(up.Icons.note),
          Icon(up.Icons.loop),
          Icon(up.Icons.left),
          Icon(up.Icons.share),
          Icon(up.Icons.pause),
          Icon(up.Icons.settings),
          Icon(up.Icons.note_beamed),
          Icon(up.Icons.shuffle),
          Icon(up.Icons.cd),
          Icon(up.Icons.globe),
          Icon(up.Icons.plus_circled),
          Icon(up.Icons.cancel_circled),
          Icon(up.Icons.folder),
        ],
      );

  get cards => [
        up.DoubleBottomCard(
          padding: up.Dimensions.space1,
          child: BodyText1("X Double Bottom Card"),
        ),
        SizedBox(height: 10),
        up.DoubleBottomCard(
          padding: up.Dimensions.space1,
          child: BodyText1("X Double Bottom Card"),
          bottomColor: Get.theme.colorScheme.secondary,
        ),
      ];

  get buttons => [
        Row(
          children: [
            up.Button(
              icon: up.Icons.left,
              onPressed: () {},
              style: up.ButtonStyle.primary,
            ),
            up.Space4(),
            up.Button(
              label: "home",
              icon: up.Icons.home,
              onPressed: () {},
              style: up.ButtonStyle.secondary,
            ),
            up.Space4(),
            up.Button(
              label: "transparent",
              onPressed: () {},
              style: up.ButtonStyle.transparent,
            ),
          ],
        ),
        up.Space4(),
        Row(
          children: [
            up.Button.round(
              icon: up.Icons.headset,
              onPressed: () {},
              style: up.ButtonStyle.primary,
            ),
            up.Space4(),
            up.Button.round(
              icon: up.Icons.home,
              onPressed: () {},
              style: up.ButtonStyle.secondary,
            ),
            up.Space4(),
            up.Button.round(
              icon: up.Icons.globe,
              onPressed: () {},
              style: up.ButtonStyle.transparent,
            ),
          ],
        ),
      ];

  List<Widget> get tabs => [
        DefaultTabController(
          length: 4,
          child: up.TabBar(
            tabs: ["Overview", "Songs", "Album", "Artists"],
          ),
        ),
        // up.Space1(),
      ];

  List<Widget> get searchBars => [
        up.SearchBar(),
      ];

  List<Widget> get playlistCards => [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            up.PlaylistCard(),
            up.PlaylistCard(),
          ],
        ),
      ];

  List<Widget> get songCards => [
        up.SongCard(),
      ];
}
