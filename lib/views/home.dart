import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:widgetbox/utils/constants/colors.dart';
import 'package:widgetbox/widgets/buttons/default_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static String routeNamed = "/MainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Test"),
            DefaultButton(text: "Press Here",color: BLUE,backColor: YELLOW_DARK,)
            
          ],
        ),
      ),
    );
  }
}
