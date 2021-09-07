import 'package:get/get.dart';
import 'package:unusable_player/pages/ui_kit/ui_kit.dart';

part 'routes.dart';

class Pages {
  static const String initial = Routes.UIKit;

  static List<GetPage> pages = [
    GetPage(
      name: Routes.UIKit,
      page: () => UIKit(),
    )
  ];
}
