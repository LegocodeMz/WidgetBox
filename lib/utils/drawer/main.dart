import 'package:flutter/material.dart';
import 'package:widgetbox/utils/constants/colors.dart';
import 'package:widgetbox/utils/drawer/headerInfo.dart';
import 'package:widgetbox/utils/drawer/listInfo.dart';
import 'package:widgetbox/utils/drawer/userInfo.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: SECONDARY,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DrawerHeaderInfo(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.grey,
              ),
              InfoListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.home_outlined,
                title: 'Home',
                infoCount: 0,
              ),
              InfoListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.message_rounded,
                title: 'Messages',
                infoCount: 8,
              ),
              InfoListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.link,
                title: 'References',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
              ),
              // const ThemeSwitch(),
              const Divider(color: Colors.grey),
              const Spacer(),
              InfoListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.info_outline_rounded,
                title: 'About',
                infoCount: 2,
              ),
              InfoListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.settings,
                title: 'Settings',
                infoCount: 0,
              ),
              const SizedBox(height: 10),
              UserInfo(isCollapsed: _isCollapsed),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
