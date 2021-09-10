import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neat/neat.dart';

class NormalAppBar extends AppBar {
  NormalAppBar({
    required String title,
    VoidCallback? onBack,
  }) : super(
          title: Headline3(title),
          centerTitle: true,
          backgroundColor: Get.theme.colorScheme.background,
          elevation: 0,
          leading: onBack == null
              ? OutlinedButton(
                  onPressed: onBack,
                  child: Text("test1"),
                )
              : null,
          // actions: [
          //   OutlinedButton(
          //     onPressed: () {},
          //     child: Text("test"),
          //   ),
          // ],
        );
}
