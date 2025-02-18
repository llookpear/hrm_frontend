import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../models/admin/overtime_model/overtime_model.dart';
import '../../../../models/enum.dart';
import '../../../../utils/format.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/class/convert_datetime_number.dart';
import '../../../widgets/class/status_color.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/overtime_all_card_outline_widget.dart';
import 'admin_overtime_detail_screen/admin_overtime_detail.screen.dart';
import 'admin_overtime_provider.dart';

class OvertimeAddminScreenWidget extends StatelessWidget {
  const OvertimeAddminScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AddminOvertimeScreenWidget();
  }
}

class _AddminOvertimeScreenWidget extends HookConsumerWidget {
  const _AddminOvertimeScreenWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncOvertimeProvider = ref.watch(allovertimeProvider);
    const String appBarTitle = " Overtime";

    final overtimeList = asyncOvertimeProvider.value;
    if (overtimeList == null) {
      return Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
            color: AppColor.primaryYellowColor, size: 50),
      );
    }
    final List<TabNameAdmin> tabNames = TabNameAdmin.values.toList();
    tabNames.map((tab) => Tab(text: Format.getTabNameAdminDisplay(tab))).toList();

    var tabController = useTabController(
      initialLength: tabNames.length,
    );
    final groupedByLeaveType = {
      for (var status in tabNames.where((status) => status != TabNameAdmin.All))
        status: overtimeList
            .where((overtime) =>
                Format.getTabNameAdminFromStatusID(overtime.statusID) == status)
            .toList(),
    };

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: const Row(
          children: [
            FontsStyle(
                text: appBarTitle,
                color: AppColor.darkGreyColor,
                weight: FontWeight.w600
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Column(
            children: [
              Container(
                height: 50,
                padding:  EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.003,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: TabBar(
                    dividerColor: Colors.grey[200],
                    padding: const EdgeInsets.all(5),
                    labelColor: AppColor.darkGreyColor,
                    unselectedLabelColor: AppColor.lightGreyColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    controller: tabController,
                    tabs: tabNames
                        .map((tab) =>
                            Tab(text: Format.getTabNameAdminDisplay(tab)))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          LeaveListView(leaves: overtimeList),
          ...groupedByLeaveType.values.map(
            (leaves) => LeaveListView(leaves: leaves),
          ),
        ],
      ),
    );
  }
}

class LeaveListView extends StatefulWidget {
  final List<OvertimeModel> leaves;

  const LeaveListView({super.key, required this.leaves});

  @override
  State<LeaveListView> createState() => _LeaveListViewState();
}

class _LeaveListViewState extends State<LeaveListView> {
  ConvertDateTime convert = ConvertDateTime();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Expanded(
                  child: ListView.builder(
                    itemCount: widget.leaves.length,
                    itemBuilder: (context, index) {
                      final data = widget.leaves[index];
                      Color pbgColor;
                      Color pfontColor;
                      final formattedStartTime =
                          convert.convertTime(data.startTime);
                      final formattedEndTime =
                          convert.convertTime(data.endTime);
                      final formattedDate =
                          convert.convertDateEeDdMmm(data.date);
                      final colors = StatusColor.getColors(
                          Format.statusName(data.statusID));
                      pbgColor = colors.pbgColor;
                      pfontColor = colors.pfontColor;
                      return OvertimeAllCardOutlineWidget(
                        otID: data.otID.toString(),
                        title: data.title,
                        date: formattedDate,
                        firstname: data.firstname,
                        lastname: data.lastname,
                        startTime: formattedStartTime,
                        endTime: formattedEndTime,
                        detail: data.detail.toString(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddminOvertimeDetailScreen(item: data),
                            ),
                          );
                        },
                        bgColor: pbgColor,
                        fontColor: pfontColor,
                        status: Format.statusName(data.statusID), position: data.position, department: data.department,
                      );
                    },
                  ),
                )

        ],
      ),
    );
  }
}
