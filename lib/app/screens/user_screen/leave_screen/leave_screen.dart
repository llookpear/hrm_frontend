import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/router.dart';
import '../../../../utils/format.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/class/icons.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/leave_total_widget.dart';
import 'leave_provider.dart';

class LeaveScreenWidget extends HookConsumerWidget {
  const LeaveScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberFormat = NumberFormat('00');
    final asyncLeaveQuotaDetail = ref.watch(leaveTakenAndQuotaProvider);
    const String appBarTitle = "Leave";
    const String menuTitle = "Request";
    const String requestButton = "Leave Request";
    const String statusButton = "Request Status";
    const String historyButton = "History";

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBarWidget(
          title: appBarTitle,
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColor.backgroundColor,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
              children: asyncLeaveQuotaDetail.when(
                data: (data) {
                  return List.generate(
                    (data.length / 2).ceil(),
                    (rowIndex) {
                      int firstIndex = rowIndex * 2;
                      int secondIndex = firstIndex + 1;
                      return Row(
                        children: [
                          Expanded(
                            child: LeaveTotalWidget(
                              title: Format.leaveName(data[firstIndex].type),
                              primaryColor: getColorForIndex(firstIndex),
                              secondColor:
                                  getColorForIndex(firstIndex, secondary: true),
                              number:
                                  '${numberFormat.format(int.parse(data[firstIndex].leaveTaken))} / ${numberFormat.format(data[firstIndex].quota)}',
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (secondIndex < data.length)
                            Expanded(
                              child: LeaveTotalWidget(
                                title: Format.leaveName(data[secondIndex].type),
                                primaryColor: getColorForIndex(secondIndex),
                                secondColor: getColorForIndex(secondIndex,
                                    secondary: true),
                                number:
                                    '${numberFormat.format(int.parse(data[firstIndex].leaveTaken))} / ${numberFormat.format(data[secondIndex].quota)}',
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
                loading: () => [
                  Center(
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: AppColor.primaryYellowColor, size: 50),
                  ),
                ],
                error: (error, stack) => [
                  const Center(child: Text('')),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const FontsStyle(
                text: menuTitle,
                color: AppColor.lightGreyColor,
                weight: FontWeight.w100),
            const SizedBox(height: 8),
            ButtonWidget(
              preIcon: AppIcons.leaveCore(),
              title: requestButton,
              onPressed: () {
                ref.read(routerProvider).push(AppRouter().leaveRequestScreen);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              preIcon: AppIcons.notificationAppCore(),
              title: statusButton,
              onPressed: () {
                ref
                    .read(routerProvider)
                    .push(AppRouter().leaveRequestStatusScreen);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              preIcon: AppIcons.historyClockCore(),
              title: historyButton,
              onPressed: () {
                ref.read(routerProvider).push(AppRouter().leaveHistoryScreen);
              },
            ),
          ]),
        )));
  }
}
