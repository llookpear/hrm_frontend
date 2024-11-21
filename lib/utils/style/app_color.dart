import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xFFF8D57E);
  static const Color primaryBlueColor = Color(0xFF0095FF);
  static const Color primaryLightBlueColor = Color(0xFFEAF2FF);
  static const Color secondaryLightBlueColor = Color(0xFFB3DAFF);
  static const Color secondaryBlueColor = Color(0xFFEFF9FE);
  static const Color primaryGreenColor = Color(0xFF61D2C4);
  static const Color secondaryGreenColor = Color(0xFFEFFAF9);
  static const Color backgroundGreenColor = Color(0xFFCCEBE7);
  static const Color primaryPurpleColor = Color(0xFF735BF2);
  static const Color secondaryPurpleColor = Color(0xFFF1EFFE);
  static const Color primaryPinkColor = Color(0xFFFF00D6);
  static const Color secondaryPinkColor = Color(0xFFFFE5FB);
  static const Color primaryYellowColor = Color(0xFFFFD140);
  static const Color secondaryYellowColor = Color(0xFFFEFBF2);
  static const Color darkGreyColor = Color(0xFF4F4F4F);
  static const Color lightGreyColor = Color(0xFF9C9C9B);
  static const Color bluishGrayColor = Color(0xFF8F9BB3);

  static const Color cancelButtonColor = Colors.grey;
  static const Color dividerColor = Color(0xFFE1E1E1);
  static const Color borderSideColor = Color(0xFFD9D9D9);
  static const Color backgroundColor = Color(0xFFF9F9F9);

  static const Color iconInAdminColor = Color(0xFF4285F4);

  static const Color primarySuccessColor = Color(0xFF29D890);
  static const Color secondarySuccessColor = Color(0xFFBFF3DE);

  // static const Color primarySuccessColor = Color(0xFF007A33);
  // static const Color secondarySuccessColor = Color(0xFFC6E6D9);

  static const Color primaryCancelColor = Color(0xFFB00000);
  static const Color secondaryCancelColor = Color(0xFFFFD3D3);

  static const Color primaryPendingColor = Color(0xFFFF9C40);
  static const Color secondaryPendingColor = Color(0xFFFFD7B3);

}

const cardColors = [

  [AppColor.secondaryGreenColor, AppColor.primaryGreenColor],
  [AppColor.secondaryPurpleColor, AppColor.primaryPurpleColor],
  [AppColor.secondaryPinkColor, AppColor.primaryPinkColor],
  [AppColor.secondaryYellowColor, AppColor.primaryYellowColor],

];

Color getColorForIndex(int index, {bool secondary = false}) {
  const colors = cardColors;
  return colors[index % colors.length][secondary ? 1 : 0];
  // ถ้าส่ง index 0
  // colors[0 % 4][0] --> colors[0][0]
  //
  // ถ้าส่ง index 0 ,  secondary: true
  //colors[0 % 4][1] --> colors[0][1]
  //
  // ถ้าส่ง index 1
  // colors[1 % 4][0] --> colors[1][0]
  //
  // ถ้าส่ง index 1 ,  secondary: true
  //colors[1 % 4][1] --> colors[1][1]
  //
  //ถ้า index มากกว่าหมายเลขของสีในlist % จะทำให้กลับไปที่จุดเริ่มต้น
}
