import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../models/enum.dart';
import '../../../../../routing/app_router.dart';
import '../../../../../routing/router.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../profile_menu_screen/profile_provider.dart';
import 'package:hrm_project/app/widgets/class/icons.dart';

class RequestScreenWidget extends HookConsumerWidget {
  const RequestScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserDetails = ref.watch(profileDetailProvider);
    const String appBarTitle = "Request";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FontsStyle(
                      size: 20,
                      text: appBarTitle,
                      color:  AppColor.darkGreyColor,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  preIcon: AppIcons.leaveCore(),
                  title: Request.Leave.name,
                  onPressed: () {
                    ref.read(routerProvider).push(AppRouter().leaveScreen);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  preIcon: AppIcons.overtimeCore(),
                  title: Request.Overtime.name,
                  onPressed: () {
                    ref.read(routerProvider).push(AppRouter().overtimeScreen);
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  preIcon: AppIcons.shiftWorkCore(),
                  title: Request.ShiftWork.name,
                  onPressed: () {
                    asyncUserDetails.when(
                      data: (data) {
                        ref.read(routerProvider).push(AppRouter().shiftworkScreen,
                            extra: data.staffID.toString());
                      },
                      loading: () =>  Center(child: LoadingAnimationWidget.horizontalRotatingDots(
                          color: AppColor.primaryYellowColor, size: 50),),
                      error: (error, stack) => Text('Error: $error'),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  preIcon:AppIcons.payrollCore(),
                  title: Request.Payroll.name,
                  onPressed: () {
                    ref.read(routerProvider).push(AppRouter().payrollScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
