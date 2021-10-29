import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.tabs,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final List<IconData> tabs;
  final int selected;
  final ValueChanged<int> onSelected;

  Color iconColor(BuildContext context, int index) => index == selected
      ? Theme.of(context).colorScheme.secondary
      : Theme.of(context).colorScheme.surface;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      padding: const EdgeInsets.all(up.Dimensions.space3),
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildTabs(context),
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context) => tabs
      .mapIndexed((index, icon) => Icon(
            icon,
            color: iconColor(context, index),
          ))
      .toList();
}
