import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'package:get/get.dart';
import 'package:neat/neat.dart';
import 'package:url_launcher/url_launcher_string.dart';

String get _darkThemeSwitchTitle => "dark_mode_switch".tr;
final _random = Random();

void _launchGithubAccount() => launchUrlString("https://github.com/Pierre2tm/");
void _launchTwitterAccount() =>
    launchUrlString("https://twitter.com/Pierre2tm/");

Drawer homeDrawerMenu(BuildContext context) => Drawer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                style: BorderStyle.solid,
                color: context.colorScheme.onBackground,
                width: up.Dimensions.borderSize),
          ),
        ),
        child: ListView(children: [
          const up.Space1(),
          const _Pierre2tmProfilePicture(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                splashColor: context.colorScheme.primary,
                onPressed: _launchGithubAccount,
                icon: const Icon(
                  up.SocialMediaIcons.github,
                  size: up.Dimensions.icon2,
                ),
              ),
              IconButton(
                splashColor: context.colorScheme.primary,
                onPressed: _launchTwitterAccount,
                icon: const Icon(
                  up.SocialMediaIcons.twitter,
                  size: up.Dimensions.icon2,
                ),
              )
            ],
          ),
          const up.Space2(),
          SwitchListTile(
            value: Get.isDarkMode,
            title: Text(_darkThemeSwitchTitle),
            onChanged: (_) {
              up.ThemeService.instance.switchThemeMode();
              Navigator.pop(context);
            },
          ),
          SwitchListTile(
            value: Get.locale == const Locale("jp_JP"),
            title: Text("japanese_mode".tr),
            onChanged: (_) {
              if (Get.locale == const Locale("jp_JP")) {
                up.LangService.instance.switchTo(const Locale("en_US"));
              } else {
                up.LangService.instance.switchTo(const Locale("jp_JP"));
              }
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );

class _Pierre2tmProfilePicture extends StatelessWidget {
  const _Pierre2tmProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: up.Suspended(
        maxXShift: 0.25,
        random: _random,
        child: Container(
          padding: const up.Padding5.all(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(up.Dimensions.image1),
            border: Border.all(
              style: BorderStyle.solid,
              color: context.colorScheme.onBackground,
              width: up.Dimensions.borderSize,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(up.Dimensions.image1),
            child: Image.network(
              "https://avatars.githubusercontent.com/u/80128417",
              width: up.Dimensions.image2,
              height: up.Dimensions.image2,
            ),
          ),
        ),
      ),
    );
  }
}
