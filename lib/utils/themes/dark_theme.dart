import 'package:flutter/material.dart';
import 'package:widgetbox/utils/constants/colors.dart';
import 'package:widgetbox/utils/themes/abstract_theme.dart';

class DarkTheme implements WidgetboxTheme {
  @override
  Color backgroundColor = Colors.grey[900] ?? BLACK;

  @override
  Color accentColor = Color(0xFF00B0E6);

  @override
  Color fontColor = WHITE;

  @override
  Color secondaryColor = Colors.grey[800] ?? GREY;
}
