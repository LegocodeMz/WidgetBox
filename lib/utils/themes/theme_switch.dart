import 'package:widgetbox/utils/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  // final bool isCollapsed;

  const ThemeSwitch({
    Key ? key,
    // required this.isCollapsed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);

    return SwitchListTile(
      title: const Text("Theme Mode"),
      secondary: const Icon(Icons.dark_mode),
      value: themeChange.themeMode,
      onChanged: (bool? value) {
        themeChange.theme = value as bool;
      },
      activeColor: Theme.of(context).primaryColorDark,
    );
  }
}
