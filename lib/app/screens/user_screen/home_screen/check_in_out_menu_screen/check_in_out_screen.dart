import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrm_project/app/widgets/class/icons.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/fonts_style_widget.dart';
import 'check_in_out_type/beacon_check.dart';
import 'check_in_out_type/gps_check.dart';

class Choice {
  const Choice(
      {
        required this.title,
      required this.selectedIcon,
      required this.unSelectedIcon});

  final String title;
  final SvgPicture selectedIcon;
  final SvgPicture unSelectedIcon;
}

List<Choice> choices = <Choice>[
  Choice(
      title: CheckType.Beacon.name,
      selectedIcon: AppIcons.bluetoothCoreSelected(),
      unSelectedIcon: AppIcons.bluetoothCoreUnselected()),
  Choice(
      title: CheckType.GPS.name,
      selectedIcon: AppIcons.locationCoreSelected(),
      unSelectedIcon: AppIcons.locationCoreUnselected()),
];

List<Widget> screens = [
  const BeaconCheckScreenWidget(),
  const GPSCheckScreenWidget(),
];

class CheckInOutScreenWidget extends StatefulWidget {
  const CheckInOutScreenWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CheckScreenWidget();
}

class _CheckScreenWidget extends State<StatefulWidget> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    const String appBarTitle = 'Check In/Out';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor:AppColor.backgroundColor,
            title: const FontsStyle(
              size: 20,
              text: appBarTitle,
              color: AppColor.darkGreyColor,
              weight: FontWeight.w600,
            ),
            bottom: TabBar(
              overlayColor: MaterialStateProperty.all(Colors.white),
              dividerColor: Colors.white,
              indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              onTap: (index) => setState(() => _bottomNavIndex = index),
              tabs: choices.map((Choice choice) {
                bool isSelected = choices.indexOf(choice) == _bottomNavIndex;
                return SizedBox(
                  width: 100,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      isSelected ? choice.selectedIcon : choice.unSelectedIcon,
                      const SizedBox(height: 4),
                      FontsStyle(
                        text: choice.title,
                        color: isSelected ? AppColor.darkGreyColor : AppColor.lightGreyColor,
                        weight: FontWeight.w200,
                        size: 10,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          body: screens[_bottomNavIndex],
        ),
      ),
    );
  }
}
