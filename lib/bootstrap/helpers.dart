import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/themes/styles/base_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';

// Add your helper methods here
// ...

/// helper to find correct color from the [context].
class ThemeColor {
  static BaseColorStyles get(BuildContext context) {
    return ((Theme.of(context).brightness == Brightness.light)
        ? ThemeConfig.light().colors
        : ThemeConfig.dark().colors);
  }
}

/// helper to set colors on TextStyle
extension ColorsHelper on TextStyle {
  TextStyle? setColor(
      BuildContext context, Color Function(BaseColorStyles color) newColor) {
    return this.copyWith(color: newColor(ThemeColor.get(context)));
  }
}

class AppHelper {
  /// 一次加载多少篇博客
  static int get defaultBlogPageSize =>
      int.parse(getEnv('BLOG_PAGESIZE', defaultValue: '10').toString());
}
