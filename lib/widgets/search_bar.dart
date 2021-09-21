import 'package:flutter/material.dart';

import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

class SearchBar extends StatelessWidget {
  const SearchBar();

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      padding: 0,
      borderRadius: up.Dimensions.borderRadius2,
      bottomHorizontalPadding: up.Dimensions.space4,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(up.Dimensions.space4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryVariant,
              borderRadius: BorderRadius.circular(up.Dimensions.borderRadius2),
            ),
            foregroundDecoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: up.Dimensions.borderSize,
                ),
              ),
            ),
            child: Icon(
              up.Icons.search,
              size: up.Dimensions.icon1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: up.Dimensions.space4),
              child: TextField(
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: Theme.of(context).textTheme.headline4,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
