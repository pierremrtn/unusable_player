import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'cover_animated_dots.dart';

class Cover extends StatefulWidget {
  const Cover({
    this.height = 189,
    this.triggerThreshold = 0.3,
    this.dragSensibility = 0.01,
    required this.artwork,
    Key? key,
  }) : super(key: key);

  final double height;
  final double triggerThreshold;
  final double dragSensibility;
  final Uint8List? artwork;

  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> with SingleTickerProviderStateMixin {
  _CoverState();

  late AnimationController _animController;
  late AnimatedDotsController _dotsController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      value: 0.5,
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _dotsController = AnimatedDotsController(
      showPrev: true,
      showNext: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: GestureDetector(
        onVerticalDragEnd: _verticalDragEndHandle,
        onVerticalDragUpdate: _verticalDragHandle,
        onVerticalDragStart: _verticalDragStartHandle,
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
                  controller: _dotsController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verticalDragStartHandle(DragStartDetails drag) {
    // _dotsController.onDrag(newValue);
    // _animController.value = newValue;
    _dotsController.onDrag(0.5);
  }

  void _verticalDragHandle(DragUpdateDetails drag) {
    final deltaY = drag.primaryDelta!;
    final currentValue = _animController.value;
    final newValue = currentValue + (deltaY * widget.dragSensibility);
    _dotsController.onDrag(newValue);
    _animController.value = newValue;
  }

  void _verticalDragEndHandle(DragEndDetails drag) {
    final value = _animController.value;
    if (value < widget.triggerThreshold) {
      _dotsController.goPrev();
    } else if (value > 1 - widget.triggerThreshold) {
      _dotsController.goNext();
    } else {
      _dotsController.cancel();
    }
    _animController.value = 0.5;
  }
}
