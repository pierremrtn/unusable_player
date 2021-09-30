import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

const double kSearchBarHeight = 56;
const double _kRightShift = up.Dimensions.space1;

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.onSearch,
  });

  final Function(String)? onSearch;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          ConstrainedBox(
        constraints: BoxConstraints.expand(
          width: constraints.maxWidth,
          height: kSearchBarHeight,
        ),
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.centerLeft,
            maxWidth: constraints.maxWidth + _kRightShift,
            child: up.DoubleBottomCard(
              padding: 0,
              height: kSearchBarHeight,
              // width: MediaQuery.of(context).size.width,
              backgroundColor: context.colorScheme.secondaryVariant,
              borderRadius: up.Dimensions.borderRadius2,
              bottomHorizontalPadding: up.Dimensions.space4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(up.Dimensions.space4),
                    foregroundDecoration: BoxDecoration(),
                    child: Icon(
                      up.Icons.search,
                      size: up.Dimensions.icon1,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: up.Dimensions.space4,
                        right: _kRightShift + up.Dimensions.space4,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        border: Border(
                          left: BorderSide(
                            color: context.colorScheme.onSurface,
                            width: up.Dimensions.borderSize,
                          ),
                        ),
                      ),
                      child: Align(
                        child: TextField(
                          // textAlign: TextAlign.center,
                          // textAlignVertical: TextAlignVertical.bottom,
                          onSubmitted: onSearch,
                          style: context.textTheme.subtitle1?.copyWith(
                            color: context.colorScheme.onSurface,
                          ),
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: context.textTheme.headline4,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return up.DoubleBottomCard(
      padding: 0,
      height: kSearchBarHeight,
      // width: MediaQuery.of(context).size.width,
      backgroundColor: context.colorScheme.secondaryVariant,
      borderRadius: up.Dimensions.borderRadius2,
      bottomHorizontalPadding: up.Dimensions.space4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(up.Dimensions.space4),
            foregroundDecoration: BoxDecoration(),
            child: Icon(
              up.Icons.search,
              size: up.Dimensions.icon1,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: up.Dimensions.space4),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                border: Border(
                  left: BorderSide(
                    color: context.colorScheme.onSurface,
                    width: up.Dimensions.borderSize,
                  ),
                ),
              ),
              child: Align(
                child: TextField(
                  // textAlign: TextAlign.center,
                  // textAlignVertical: TextAlignVertical.bottom,
                  onSubmitted: onSearch,
                  style: context.textTheme.subtitle1?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: context.textTheme.headline4,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          up.Space2(),
        ],
      ),
    );
  }
}
