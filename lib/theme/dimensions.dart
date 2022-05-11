import 'package:neat/generator.dart';

part 'dimensions.nt.dart';

@Neat.generate
class Dimensions {
  //spaces
  static const double space1 = 32;
  static const double space2 = 26;
  static const double space3 = 18;
  static const double space4 = 12;
  static const double space5 = 5;

  //paddings
  static const double padding1 = space1;
  static const double padding2 = space2;
  static const double padding3 = space3;
  static const double padding4 = space4;
  static const double padding5 = space5;

  //borders
  static const double borderRadius1 = 24;
  static const double borderRadius2 = 18;
  static const double borderRadius3 = 12;
  static const double borderRadius4 = 6;
  static const double borderSize = 2;

  //icons
  static const double icon1 = 26;
  static const double icon2 = 16;

  //images
  static const double image1 = 144;
  static const double image2 = 108;
  static const double image3 = 55;

  //dividers
  static const double divider1 = 1;

  //pages
  static const double paddingPage = space3;
  @Deprecated("use paddingPage instead")
  static const double pageMargin = space3;
}
