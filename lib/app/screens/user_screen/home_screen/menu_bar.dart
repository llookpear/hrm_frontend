import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/style/app_color.dart';
import 'calendar_menu_screen/calendar_screen.dart';
import 'check_in_out_menu_screen/check_in_out_screen.dart';
import 'home_menu_screen/home_menu_screen.dart';
import 'profile_menu_screen/profile_screen.dart';
import 'request_menu_screen/request_screen.dart';

class AnimatedBottomBar extends ConsumerStatefulWidget {
  const AnimatedBottomBar({super.key});
  @override
  AnimatedBottomBarState createState() => AnimatedBottomBarState();
}

class AnimatedBottomBarState extends ConsumerState<AnimatedBottomBar> {

  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {

    List<IconData> iconList = [
      FluentIcons.home_16_regular,
      FluentIcons.calendar_16_regular,
      FluentIcons.document_text_24_regular,
      FluentIcons.person_16_regular,
    ];
  List<Widget> screens = [
      const HomeMenuScreenWidget(),
      const CalendarScreenWidget(),
      const RequestScreenWidget(),
      const ProfileScreenWidget( ),
      const CheckInOutScreenWidget(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: screens[_bottomNavIndex],
        floatingActionButton: FloatingActionButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            backgroundColor: AppColor.primaryColor,
            child: const Icon(
              weight: 100,
              size: 30,
              FluentIcons.checkmark_circle_12_filled,
              // FluentIcons.checkbox_checked_16_regular,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _bottomNavIndex = 4;
              });
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          iconSize: 28,
          activeColor: AppColor.primaryColor,
          inactiveColor: AppColor.lightGreyColor,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
      ),
    );
  }
}

