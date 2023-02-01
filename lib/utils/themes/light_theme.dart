import 'package:flutter/material.dart';
import 'package:widgetbox/utils/constants/colors.dart';
import 'package:widgetbox/utils/themes/abstract_theme.dart';

class LightTheme implements WidgetboxTheme {
  @override
  Color backgroundColor = RED_LIGHT;

  @override
  Color accentColor = TEAL;

  @override
  Color fontColor = BLACK;

  @override
  Color secondaryColor = Colors.grey[800] ?? GREY;
}
