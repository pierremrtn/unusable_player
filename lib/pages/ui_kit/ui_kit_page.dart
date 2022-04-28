import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:get/get.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class UIKitPage extends StatelessWidget {
  const UIKitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return up.Page(
      appBar: up.normalAppBar(
        context: context,
        title: "UI Kit",
        onBack: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...tied,
          const up.Space1(),
          ...sliders,
          const up.Space1(),
          ...artistCards,
          const Divider(),
          ...albums,
          const Divider(),
          ...listIndicators(),
          const Divider(),
          ...playingSongIndicators,
          const Divider(),
          navBar,
          const Divider(),
          ...songCards,
          const Divider(),
          ...playlistCards,
          const Divider(),
          ...searchBars,
          const Divider(),
          ...tabs,
          const Divider(),
          ...texts(context),
          const Divider(),
          icons,
          const Divider(),
          ...cards(context),
          const Divider(),
          ...buttons,
        ],
      ),
    );
  }

  texts(BuildContext context) => [
        context.headline1("Healdine 1"),
        context.headline2("context.headline 2"),
        context.headline3("context.headline 3"),
        context.headline4("context.headline 4"),
        context.headline5("context.headline 5"),
        context.subtitle1("context.subtitle 1"),
        context.subtitle2("context.subtitle 2"),
        context.bodyText1("context.bodyText 1"),
      ];

  get icons => Wrap(
        children: const [
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

  listIndicators() => const [
        up.EmptyListIndicator(),
        up.LoadingListIndicator(),
      ];

  cards(BuildContext context) => [
        up.DoubleBottomCard(
          onTap: () {},
          padding: const EdgeInsets.all(up.Dimensions.space1),
          child: context.bodyText1("X Double Bottom Card"),
        ),
        const SizedBox(height: 10),
        up.DoubleBottomCard(
          onTap: () {},
          padding: const EdgeInsets.all(up.Dimensions.space1),
          child: context.bodyText1("X Double Bottom Card"),
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
            const up.Space4(),
            up.Button(
              label: "home",
              icon: up.Icons.home,
              onPressed: () {},
              style: up.ButtonStyle.secondary,
            ),
            const up.Space4(),
            up.Button(
              label: "transparent",
              onPressed: () {},
              style: up.ButtonStyle.transparent,
            ),
          ],
        ),
        const up.Space4(),
        Row(
          children: [
            up.Button.round(
              icon: up.Icons.headset,
              onPressed: () {},
              style: up.ButtonStyle.primary,
            ),
            const up.Space4(),
            up.Button.round(
              icon: up.Icons.home,
              onPressed: () {},
              style: up.ButtonStyle.secondary,
            ),
            const up.Space4(),
            up.Button.round(
              icon: up.Icons.globe,
              onPressed: () {},
              style: up.ButtonStyle.transparent,
            ),
          ],
        ),
      ];

  List<Widget> get tabs => [
        const DefaultTabController(
          length: 4,
          child: up.TabBar(
            tabs: ["Overview", "Songs", "Album", "Artists"],
          ),
        ),
        // const up.Space1(),
      ];

  List<Widget> get searchBars => [
        const up.SearchBar(),
      ];

  List<Widget> get playlistCards => [
        const up.PlaylistCard(),
        const up.Space4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: up.PlaylistCard()),
            up.Space4(),
            Expanded(child: up.PlaylistCard()),
          ],
        ),
      ];

  List<Widget> get songCards => [
        const up.SongCard(
          song: up.Song(
            uri: "",
            title: "title",
            duration: Duration(seconds: 30, minutes: 2),
            album: up.AlbumRef(),
            artist: up.ArtistRef(),
            id: 0,
          ),
        ),
      ];

  Widget get navBar => up.NavBar(
        tabs: const [
          up.Icons.home,
          up.Icons.cd,
          up.Icons.library_music,
        ],
        selected: 0,
        onSelected: (_) {},
      );

  List<Widget> get playingSongIndicators => [
        const up.PlayingSongIndicator(
          song: up.Song(
            id: 0,
            title: "z",
            uri: "",
            duration: Duration(),
            artist: up.ArtistRef(),
            album: up.AlbumRef(),
          ),
        ),
      ];

  List<Widget> get albums => [
        const up.AlbumCard(
          album: up.Album(
            id: 0,
            artist: up.ArtistRef(id: 0, name: "Artist"),
            title: "test title",
            songNumber: 20,
          ),
        ),
      ];

  List<Widget> get artistCards => [
        const up.ArtistCard(
          artist: up.Artist(
            id: 0,
            name: "Skeler",
            numberOfTracks: 1,
          ),
        ),
      ];

  List<Widget> get sliders => [
        SliderTheme(
          data: const SliderThemeData(thumbShape: up.RRectSliderThumbShape()),
          child: ValueBuilder<double>(
            initialValue: 0,
            builder: (double? value, void Function(double) onChange) => Slider(
              value: value ?? 0,
              onChanged: onChange,
            ),
          ),
        ),
        SliderTheme(
          data: SliderThemeData(thumbShape: up.JiggleSliderThumbShape()),
          child: ValueBuilder<double>(
            initialValue: 0,
            builder: (double? value, void Function(double) onChange) => Slider(
              value: value ?? 0,
              onChanged: onChange,
            ),
          ),
        ),
        SliderTheme(
          data: SliderThemeData(thumbShape: up.JiggleSliderThumbShape()),
          child: ValueBuilder<double>(
            initialValue: 0,
            builder: (double? value, void Function(double) onChange) => Slider(
              value: value ?? 0,
              onChanged: onChange,
            ),
          ),
        ),
        ValueBuilder<double>(
          initialValue: 0,
          builder: (double? value, void Function(double) onChange) =>
              up.JigglingSlider(
            value: value ?? 0,
            onChanged: onChange,
          ),
        ),
        ValueBuilder<double>(
          initialValue: 0,
          builder: (double? value, void Function(double) onChange) =>
              up.JigglingSlider(
            value: value ?? 0,
            onChanged: onChange,
          ),
        ),
      ];

  List<Widget> get tied {
    final random = Random();
    return [
      up.Tied(
        random: random,
        child: const up.SongCard(
          song: up.Song(
            uri: "",
            title: "title",
            duration: Duration(seconds: 30, minutes: 2),
            album: up.AlbumRef(),
            artist: up.ArtistRef(),
            id: 0,
          ),
        ),
      ),
      const up.Space3(),
      up.Tied(
        random: random,
        child: const up.SongCard(
          song: up.Song(
            uri: "",
            title: "title",
            duration: Duration(seconds: 30, minutes: 2),
            album: up.AlbumRef(),
            artist: up.ArtistRef(),
            id: 0,
          ),
        ),
      ),
      const up.Space3(),
      up.Tied(
        random: random,
        child: const up.SongCard(
          song: up.Song(
            uri: "",
            title: "title",
            duration: Duration(seconds: 30, minutes: 2),
            album: up.AlbumRef(),
            artist: up.ArtistRef(),
            id: 0,
          ),
        ),
      ),
    ];
  }
}
