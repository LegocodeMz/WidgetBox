import 'package:flutter/material.dart';
import 'package:widgetbox/routes/app.dart';
import 'package:widgetbox/utils/constants/colors.dart';
import 'package:widgetbox/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WidgetBox',
      theme: ThemeData(
          fontFamily: 'Lato',
          primaryColor: BLUE,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: ACCENT)),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: MainPage.routeNamed,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}