import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'cover_animated_dots.dart';

class Cover extends StatefulWidget {
  const Cover({
    this.height = 189,
    required this.artwork,
    Key? key,
  }) : super(key: key);

  final double height;
  final Uint8List? artwork;

  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> {
  _CoverState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: GestureDetector(
        onVerticalDragEnd: _verticalDragEndHandle,
        onVerticalDragUpdate: _verticalDragHandle,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const up.Space3(),
            Expanded(
              child: up.DoubleBottomCard(
                padding: const EdgeInsets.all(up.Dimensions.space5),
                child: up.Image(
                  widget.artwork != null
                      ? MemoryImage(widget.artwork!) as ImageProvider<Object>
                      : const AssetImage("assets/skeler.jpg"),
                  height: up.Dimensions.image1,
                  radius: up.Dimensions.borderRadius2,
                ),
              ),
            ),
            SizedBox(
              width: up.Dimensions.paddingPage + up.Dimensions.space4,
              child: Align(
                alignment: Alignment.center,
                child: CoverAnimatedDots(
                  height: widget.height,
                  width: up.Dimensions.space4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verticalDragEndHandle(DragEndDetails drag) {}

  void _verticalDragHandle(DragUpdateDetails drag) {}
}
