import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'package:get/get.dart';

Drawer homeDrawerMenu(BuildContext context) => Drawer(
      child: ListView(children: [
        ListTile(
          title: Text(Get.isDarkMode
              ? "switch_to_light_mode_button".tr
              : "switch_to_dark_mode_button".tr),
          onTap: () {
            up.ThemeService.instance.switchThemeMode();
            Navigator.pop(context);
          },
        ),
      ]),
    );
