import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: Main.routeNamed,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}