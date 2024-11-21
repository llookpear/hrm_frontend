import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/routing/router.dart';
import 'package:hrm_project/utils/style/app_color.dart';
import 'environment.dart';

Future<void> main() async {
  await Environment.setup();
  ///debugPaintSizeEnabled = true;
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
        title: 'Hrm',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        theme: ThemeData(
          timePickerTheme: TimePickerThemeData(
            backgroundColor: Colors.white,
            hourMinuteColor: Colors.white,
            dialHandColor: AppColor.primaryGreenColor,
            dialBackgroundColor: Colors.white,
            dayPeriodTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              color:  AppColor.darkGreyColor,
            ),
            confirmButtonStyle: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(AppColor.primaryBlueColor),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
            cancelButtonStyle: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(AppColor.borderSideColor),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
          ),
          datePickerTheme: DatePickerThemeData(
            dayStyle: const TextStyle(
              fontFamily: 'Poppins',
            ),
            headerHeadlineStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30,
            ),
            weekdayStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
            headerBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            confirmButtonStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return AppColor.primaryBlueColor;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.white;
              }),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                  (Set<MaterialState> states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                );
              }),
            ),
            cancelButtonStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return  AppColor.borderSideColor;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return Colors.white;
              }),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                  (Set<MaterialState> states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                );
              }),
            ),
            dayBackgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return AppColor.primaryColor;
              }
              return Colors.white;
            }),
            todayBackgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return AppColor.primaryColor;
              }
              return AppColor.primarySuccessColor;
            }),
            todayForegroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.white;
            }),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(left: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.borderSideColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.borderSideColor),
            ),
          ),
        )
    );
  }
}

