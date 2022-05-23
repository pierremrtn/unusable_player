import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:unusable_player/theme/theme.dart' as up;
import 'package:unusable_player/widgets/widgets.dart' as up;

const double kSearchBarHeight = 56;
const double _kRightShift = up.Dimensions.space1;

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.onSearch,
    this.onChanged,
    this.focusNode,
    this.controller,
    Key? key,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSearch;
  final FocusNode? focusNode;
  final TextEditingController? controller;

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
              padding: EdgeInsets.zero,
              height: kSearchBarHeight,
              backgroundColor: context.colorScheme.secondaryVariant,
              borderRadius: up.Dimensions.borderRadius2,
              bottomHorizontalPadding: up.Dimensions.space4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(up.Dimensions.space4),
                    foregroundDecoration: const BoxDecoration(),
                    child: const Icon(
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
                          focusNode: focusNode,
                          controller: controller,
                          textInputAction: TextInputAction.search,
                          onSubmitted: onSearch,
                          onChanged: onChanged,
                          style: context.textTheme.subtitle1?.copyWith(
                            color: context.colorScheme.onSurface,
                          ),
                          decoration: InputDecoration(
                            hintText: "search".tr,
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
  }
}
