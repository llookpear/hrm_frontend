import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/payroll_screen/salary_certificate_status_screen/salary_certificate_status_provider.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import 'package:hrm_project/utils/format.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/class/icons.dart';
import '../../../../widgets/class/status_color.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/salary_certificate_status_card_widget.dart';

class SalaryCertificateStatusScreenWidget extends HookConsumerWidget {
  const SalaryCertificateStatusScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String appBarTitle = "Status";
    const String nameOfID = 'Salary Certificate';
    ConvertDateTime convert = ConvertDateTime();
    final selectSort = StateProvider<SortBy>((ref) => SortBy.ID);

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
          padding: const EdgeInsets.only(left: 24,right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const FontsStyle(
                    text: "Sort by",
                    color: AppColor.darkGreyColor,
                    weight: FontWeight.normal,
                    size: 12,
                  ),
                  PopupMenuButton<SortBy>(
                    icon: AppIcons.sort(),
                    menuPadding: const EdgeInsets.all(4),
                    position: PopupMenuPosition.under,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    color: Colors.white,
                    iconColor: AppColor.darkGreyColor,
                    clipBehavior: Clip.none,
                    itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SortBy>>[
                      PopupMenuItem<SortBy>(
                          value: SortBy.ID,
                          child: FontsStyle(
                            text: SortBy.ID.name,
                            color: AppColor.darkGreyColor,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                          onTap: () {
                            ref.read(selectSort.notifier).state = SortBy.ID;
                          }),
                      PopupMenuItem<SortBy>(
                          value: SortBy.Date,
                          child: FontsStyle(
                            text: SortBy.Date.name,
                            color: AppColor.darkGreyColor,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                          onTap: () {
                            ref.read(selectSort.notifier).state = SortBy.Date;
                          }),
                      PopupMenuItem<SortBy>(
                          value: SortBy.Status,
                          child: FontsStyle(
                            text: SortBy.Status.name,
                            color: AppColor.darkGreyColor,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                          onTap: () {
                            ref.read(selectSort.notifier).state = SortBy.Status;
                          }),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final salaryCertificateProvider = ref.watch(certificateProvider);
                      return salaryCertificateProvider.when(
                        data: (data) {
                          final selectedSort = ref.watch(selectSort);
                          data.sort((a, b) {
                            switch (selectedSort) {
                              case SortBy.ID:
                                return a.certificateID.compareTo(b.certificateID);
                              case SortBy.Date:
                                return a.dateStamp.compareTo(b.dateStamp);
                              case SortBy.Status:
                                return a.statusID.compareTo(b.statusID);
                              default:
                                return 0;
                            }
                          });
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final status = data[index];
                              var statusColors = StatusColor.getColors(
                                  Format.statusName(status.statusID));
                              convert.convertDateMMM(status.dateStamp);
                              return SalaryCertificateCardWidget(
                                nameOfID: nameOfID,
                                id: status.certificateID.toString(),
                                status: Format.statusName(status.statusID),
                                bgColor: statusColors.pbgColor,
                                fontColor: statusColors.pfontColor,
                                dateStamp: convert
                                    .convertDateDdMmYyyy(status.dateStamp),
                                // onPressed: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           LeaveDetailScreen(item: leaveData),
                                //     ),
                                //   );
                                // },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
