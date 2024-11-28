import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';
import 'package:hrm_project/utils/style/app_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../../providers/app_provider.dart';
import '../../../../../utils/api_constant/api_constant.dart';
import '../../../../widgets/chart_widget.dart';
import '../../../../widgets/check_in_out_time_card_outline_widget.dart';
import '../../../../widgets/class/icons.dart';
import '../profile_menu_screen/profile_provider.dart';
import 'home_menu_provider.dart';

class HomeMenuScreenWidget extends HookConsumerWidget {
  const HomeMenuScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(branchProvider);
    final asyncUserDetails = ref.watch(profileDetailProvider);
    final asyncUserLeaveTotal = ref.watch(leaveTotalProvider);
    final asyncUserLeaveQuota = ref.watch(leaveQuotaProvider);
    final asyncUserOvertimeQuota = ref.watch(overtimeTotalProvider);
    final asyncCheckInOutWorkday = ref.watch(checkInOutWorkdayProvider);
    final asyncUserCheckInOutTime = ref.watch(checkInOutTimeProvider);
    const String startWorkMessage = "In time";
    const String welcomeMessage = "Welcome!";
    const String endWorkMessage = "Out time";
    const String checkIn = "Check in";
    const String checkOut = "Check out";
    const String leaving = "Leaving";
    const String overtime = "Overtime";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  asyncUserDetails.when(
                    data: (data) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: OctoImage(
                              errorBuilder: (_, __, ___) =>
                                  AppIcons.userDefaultImg(),
                              image: CachedNetworkImageProvider(
                                  APIConstance.getImage(data.userImage)),
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.width * 0.13,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FontsStyle(
                                  text: welcomeMessage,
                                  color: AppColor.darkGreyColor,
                                  weight: FontWeight.w200),
                              FontsStyle(
                                  text: '${data.firstname} ${data.lastname}',
                                  color: AppColor.darkGreyColor,
                                  weight: FontWeight.bold),
                            ],
                          )
                        ],
                      );
                    },
                    loading: () => Center(
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: AppColor.primaryYellowColor,
                        size: 50,
                      ),
                    ),
                    error: (error, stackTrace) => Text('Error: $error'),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  asyncUserCheckInOutTime.when(
                    data: (data) {
                      if (data.isEmpty) {
                      } else if (data.isNotEmpty && data.length < 2) {}
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CheckInOutTimeSmallCardOutlineWidget(
                              data: data.isNotEmpty
                                  ? convert.convertTime(data[0].time).toString()
                                  : startWorkMessage,
                              icon: AppIcons.checkoutCore(),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: CheckInOutTimeSmallCardOutlineWidget(
                              data: data.length > 1
                                  ? convert.convertTime(data[1].time).toString()
                                  // ? convert.convertTimeHHmm(data[1].time)
                                  : endWorkMessage,
                              icon: AppIcons.checkoutCore(),
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () => Center(
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: AppColor.primaryYellowColor,
                        size: 50,
                      ),
                    ),
                    error: (error, stackTrace) => Text('Error: $error'),
                  ),
                  Column(
                      children: AnimateList(
                    interval: 300.ms,
                    effects: [FadeEffect(duration: 400.ms)],
                    children: [
                      asyncCheckInOutWorkday.when(
                        data: (data) {
                          var checkInValue = data.checkIn / data.workDay * 100;
                          var checkOutValue =
                              data.checkOut / data.workDay * 100;
                          return Column(
                            children: [
                              ChartWidget(
                                title: checkIn,
                                primaryColor: AppColor.primaryGreenColor,
                                secondColor: AppColor.secondaryGreenColor,
                                number: '${data.checkIn} / ${data.workDay}',
                                pieValue1: checkInValue.ceil(),
                                pieValue2: (100 - checkInValue).toInt(),
                              ),
                              ChartWidget(
                                title: checkOut,
                                primaryColor: AppColor.primaryPurpleColor,
                                secondColor: AppColor.secondaryPurpleColor,
                                number: '${data.checkOut} / ${data.workDay}',
                                pieValue1: checkOutValue.ceil(),
                                pieValue2: (100 - checkOutValue).toInt(),
                              )
                            ],
                          );
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (error, stack) => Text('Error: $error'),
                      ),
                      asyncUserLeaveTotal.when(
                        data: (leaveTotal) {
                          return asyncUserLeaveQuota.when(
                            data: (leaveQuota) {
                              var value =
                                  int.parse(leaveTotal.total) /  int.parse(leaveQuota.quota) * 100;
                              return ChartWidget(
                                  title: leaving,
                                  primaryColor: AppColor.primaryPinkColor,
                                  secondColor: AppColor.secondaryPinkColor,
                                  number: '${leaveTotal.total} / ${leaveQuota.quota}',
                                  pieValue1: value.toInt(),
                                  pieValue2: (100 - value).toInt());
                            },
                            loading: () => const SizedBox.shrink(),
                            error: (error, stack) => Text('Error asyncUserLeaveQuota: $error'),
                          );
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (error, stack) => Text('Error asyncUserLeaveToTal: $error'),
                      ),
                      asyncUserOvertimeQuota.when(
                        data: (overtimeTotal) {
                          return ChartWidget(
                            title: overtime,
                            primaryColor: AppColor.primaryYellowColor,
                            secondColor: AppColor.secondaryYellowColor,
                            number: '${overtimeTotal.total} hrs',
                          );
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (error, stack) => Text('Error: $error'),
                      ),
                    ],
                  )),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30),
                  //   child: SizedBox(
                  //     height: 100,
                  //     child: _BarChart(),
                  //   ),
                  // ),
                ],
              ),
            )),
      ),
    );
  }
}

///กราฟแสดง ot ยังไม่ได้ใช้
//
// class _BarChart extends StatelessWidget {
//   _BarChart();
//
//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         barTouchData: barTouchData,
//         titlesData: titlesData,
//         borderData: borderData,
//         barGroups: barGroups,
//         gridData: const FlGridData(show: false),
//         alignment: BarChartAlignment.spaceAround,
//         maxY: 20,
//       ),
//     );
//   }
//
//   BarTouchData get barTouchData => BarTouchData(
//         enabled: false,
//         touchTooltipData: BarTouchTooltipData(
//           getTooltipColor: (group) => Colors.transparent,
//           tooltipPadding: EdgeInsets.zero,
//           tooltipMargin: 8,
//           getTooltipItem: (
//             BarChartGroupData group,
//             int groupIndex,
//             BarChartRodData rod,
//             int rodIndex,
//           ) {
//             String displayValue = (rod.toY % 1 == 0)
//                 ? rod.toY.toStringAsFixed(0)
//                 : rod.toY.toStringAsFixed(1);
//             return BarTooltipItem(
//               displayValue,
//               const TextStyle(
//                 color: AppColor.primaryBlueColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             );
//           },
//         ),
//       );
//
//   Widget getTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: AppColor.darkGreyColor,
//       fontWeight: FontWeight.bold,
//       fontSize: 10,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 0:
//         text = 'Jan';
//         break;
//       case 1:
//         text = 'Feb';
//         break;
//       case 2:
//         text = 'Mar';
//         break;
//       case 3:
//         text = 'Apr';
//         break;
//       case 4:
//         text = 'May';
//         break;
//       case 5:
//         text = 'Jun';
//         break;
//       case 6:
//         text = 'Jul';
//         break;
//       case 7:
//         text = 'Aug';
//         break;
//       case 8:
//         text = 'Sep';
//         break;
//       case 9:
//         text = 'Oct';
//         break;
//       case 10:
//         text = 'Nov';
//         break;
//       case 11:
//         text = 'Dec';
//         break;
//       default:
//         text = '';
//         break;
//     }
//
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 4,
//       child: Text(text, style: style),
//     );
//   }
//
//   FlTitlesData get titlesData => FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             getTitlesWidget: getTitles,
//           ),
//         ),
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//       );
//
//   FlBorderData get borderData => FlBorderData(
//         show: false,
//       );
//
//   LinearGradient get _barsGradient => const LinearGradient(
//         colors: [
//           AppColor.primaryLightBlueColor,
//           AppColor.primaryBlueColor,
//         ],
//         begin: Alignment.bottomCenter,
//         end: Alignment.topCenter,
//       );
//
//   List<double> test = [2, 3.4, 12, 5, 6, 12, 16, 9, 6, 4, 1.5, 10];
//
//   List<BarChartGroupData> get barGroups => [
//         for (int i = 0; i < 12; i++)
//           BarChartGroupData(
//             x: i,
//             barRods: [
//               BarChartRodData(
//                 toY: test[i],
//                 gradient: _barsGradient,
//               ),
//             ],
//             showingTooltipIndicators: [0],
//           ),
//       ];
// }
