import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgetbox/cupertinowidgets.dart';
import 'package:widgetbox/materialwidgets.dart';

class HomeMenuList extends StatefulWidget {
  const HomeMenuList({Key? key}) : super(key: key);

  @override
  State<HomeMenuList> createState() => _HomeMenuListState();
}

class _HomeMenuListState extends State<HomeMenuList> {
  int _selectedIndex = 0;

  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    //To animate the between different pages chage the parameters of the page controller below
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          PersonalizedWidgets(),
          const CupertinoWidgets(),
        ],
      ),
    );
  }
}
