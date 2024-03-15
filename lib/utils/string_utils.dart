import 'dart:ui';

extension ColorConvert on String {
  Color? hexStringToColor() {
    try {
      var hexString = this;

      if (hexString[0] == '#') {
        hexString = hexString.substring(1);
      }
      hexString = 'ff$hexString';

      int colorValue = int.parse(hexString, radix: 16);

      if (hexString.length == 6 || hexString.length == 8) {
        return Color(colorValue);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
