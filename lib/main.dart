import 'package:flutter/material.dart';
import 'package:widgetbox/routes/app.dart';
import 'package:provider/provider.dart';
import 'package:widgetbox/utils/themes/theme_factory.dart';
import 'package:widgetbox/utils/themes/theme_provider.dart';
import 'package:widgetbox/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = new ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.theme =
        await themeChangeProvider.themePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<ThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: 'WidgetBox',
          theme: ThemeFactory.getTheme(themeChangeProvider.themeMode),
          initialRoute: MainPage.routeNamed,
          routes: routes,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
