import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'package:get/get.dart';

String get _darkThemeSwitchTitle => Get.isDarkMode
    ? "switch_to_light_mode_button".tr
    : "switch_to_dark_mode_button".tr;

Drawer homeDrawerMenu(BuildContext context) => Drawer(
      child: ListView(children: [
        const up.Image.s1(
          NetworkImage("https://avatars.githubusercontent.com/u/80128417"),
        ),
        SwitchListTile(
          value: Get.isDarkMode,
          title: Text(_darkThemeSwitchTitle),
          onChanged: (_) {
            up.ThemeService.instance.switchThemeMode();
            Navigator.pop(context);
          },
        ),
      ]),
    );
