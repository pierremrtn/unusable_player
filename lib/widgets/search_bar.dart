import 'package:flutter/material.dart';
import 'package:unusable_player/theme/dimensions.dart';
import 'package:unusable_player/theme/theme.dart';
import 'package:unusable_player/widgets/double_bottom_card.dart';

class SearchBar extends StatelessWidget {
  const SearchBar();

  @override
  Widget build(BuildContext context) {
    return DoubleBottomCard(
      padding: 0,
      borderRadius: AppDimensions.borderRadius2,
      bottomHorizontalPadding: AppDimensions.space4,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppDimensions.space4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryVariant,
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius2),
            ),
            foregroundDecoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: AppDimensions.borderSize,
                ),
              ),
            ),
            child: Icon(
              UnusablePlayerIcons.search,
              size: AppDimensions.icon1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: AppDimensions.space4),
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
