import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class Cover extends StatelessWidget {
  const Cover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const up.DoubleBottomCard(
      padding: EdgeInsets.all(up.Dimensions.space5),
      child: up.Image(
        AssetImage("assets/skeler.jpg"),
        // fit: BoxFit.cover,
        height: up.Dimensions.image1,
        radius: up.Dimensions.borderRadius2,
      ),
    );
  }
}
