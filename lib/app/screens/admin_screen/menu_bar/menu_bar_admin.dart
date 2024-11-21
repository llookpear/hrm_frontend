import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/app/screens/admin_screen/overtime_screen/admin_overtime_screen.dart';
import '../../../../utils/style/app_color.dart';
import '../leave_screen/admin_leave_screen.dart';
import '../profile_screen/admin_profile_screen.dart';
import '../shift_work_screen/admin_shift_work_screen.dart';


class AnimatedBottomBarAddmin extends StatefulWidget {
  const AnimatedBottomBarAddmin({super.key});

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}
//
class _AnimatedBottomBarState extends State<AnimatedBottomBarAddmin> {
  List<IconData> iconList = [
    FluentIcons.document_edit_16_regular,
    FluentIcons.briefcase_person_24_regular,
    FluentIcons.shifts_team_20_regular,
    FluentIcons.person_16_regular,
  ];

  List<Widget> screens = [
    const AddminLeaveScreenWidget(),
    const OvertimeAddminScreenWidget(),
    const AddminShiftWorkScreenWidget(),
     const AddminProfileScreenWidget(),
  ];

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColor,
        body: screens[_bottomNavIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          iconSize: 28,
          activeColor: AppColor.primaryColor,
          inactiveColor:AppColor.lightGreyColor,
          activeIndex: _bottomNavIndex,
          gapLocation : GapLocation.none,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          shadow: const BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 5,
            color: AppColor.dividerColor
          ),
        ),
      ),
    );
  }
}
