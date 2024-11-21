import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/payroll_screen/payroll_provider.dart';
import 'package:hrm_project/app/screens/user_screen/payroll_screen/slip_detail_screen/slip_detail_screen.dart';
import 'package:hrm_project/app/widgets/class/icons.dart';
import '../../../../models/user/payroll/payslip_model/payslip_model.dart';
import '../../../../providers/app_provider.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/elevated_icon_button_widget.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/payroll_card_outline_widget.dart';

class PayrollScreenWidget extends HookConsumerWidget {
  const PayrollScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    const String appBarTitle = "Payroll Request";
    const String payslipTitle = "Pay Slip";
    const String salaryRequestButton = "Salary Certificate Request";
    const String statusButton = "Status";
    const String nameOfID = 'SLIP :';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.white,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              ElevatedIconButtonWidget(
                buttonBorderSideColor: AppColor.secondaryLightBlueColor,
                title: salaryRequestButton,
                onPressed: () {
                  ref.read(routerProvider).push(AppRouter().payrollrequestScreen);
                },
                icon: AppIcons.payrollCore(),
                buttonColor: AppColor.secondaryBlueColor,
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedIconButtonWidget(
                  buttonBorderSideColor: AppColor.secondaryLightBlueColor,
                  title: statusButton,
                  onPressed: () {
                    ref.read(routerProvider).push(AppRouter().statusPayrollScreenWidget);
                  },
                  icon: AppIcons.notificationAppCore(),
                  buttonColor: AppColor.secondaryYellowColor
              ),
              const SizedBox(
                height: 20,
              ),
              const FontsStyle(
                  size: 20,
                  text: payslipTitle,
                  color: AppColor.darkGreyColor,
                  weight: FontWeight.w600
              ),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final AsyncValue<List<PaySlipModel>> payRollProvider = ref.watch(payrollProvider);
                    return payRollProvider.when(
                      data: (data) {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final payroll = data[index];
                            final date = convert.convertDateDdMmYyyy(payroll.date.toString());
                            final month = DateFormat('MMMM').format(payroll.date);
                            return PayRollCardOutlineWidget(
                              month: month,
                              slipID: payroll.payslipID.toString(),
                              date: date,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SlipDetailScreen(item: payroll),
                                  ),
                                );
                              },
                              nameOfID: nameOfID,
                            );
                          },
                        );
                      },
                      loading: () => Center(
                        child: LoadingAnimationWidget.horizontalRotatingDots(
                            color: AppColor.primaryYellowColor, size: 50),
                      ),
                      error: (error, stackTrace) => Text('Error: $error'),
                    );
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
