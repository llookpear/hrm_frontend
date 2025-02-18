import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../models/admin/leave_model/leave_model.dart';
import '../../../../models/enum.dart';
import '../../../../utils/format.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/class/convert_datetime_number.dart';
import '../../../widgets/class/status_color.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/leave_all_card_outline_widget.dart';
import 'admin_leave_detail_screen/admin_leave_detail_screen.dart';
import 'admin_leave_provider.dart';

final selectedFilterProvider = StateProvider<String?>((ref) => null);

class AddminLeaveScreenWidget extends StatelessWidget {
  const AddminLeaveScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AllLeave();
  }
}

class AllLeave extends HookConsumerWidget {
  const AllLeave({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String tabLeaveMessage = "All";
    const String appBarTitle = " Leave";

    final asyncLeaveProvider = ref.watch(allleaveProvider);
    final leaveList = asyncLeaveProvider.value;

    if (leaveList == null) {
      return Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
            color: AppColor.primaryYellowColor, size: 50),
      );
    }

    final List<String> tabNames =
        leaveList.map((leave) => Format.leaveName(leave.type)).toSet().toList();

    // print(tabNames);

    tabNames.insert(0, tabLeaveMessage);
    final tabController = useTabController(
      initialLength: tabNames.length,
    );

    final groupedByLeaveType = {
      for (var type in tabNames.where((type) => type != tabLeaveMessage))
        type: leaveList
            .where((leave) => Format.leaveName(leave.type) == type)
            .toList(),
    };
    final selectedFilter = ref.watch(selectedFilterProvider);

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
              weight: FontWeight.w600,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height + 30),
          child: Column(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(
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
                    padding: const EdgeInsets.all(4),
                    labelColor: AppColor.darkGreyColor,
                    unselectedLabelColor: AppColor.lightGreyColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    controller: tabController,
                    tabs: [
                      const Tab(text: tabLeaveMessage),
                      ...groupedByLeaveType.keys.map((type) => Tab(text: type)),
                    ],
                  ),
                ),
              ),
              FilterChips(
                status: leaveList
                    .map((leave) => Format.statusName(leave.statusID))
                    .toSet()
                    .toList(),
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          LeaveListView(
            leaves: leaveList,
            filterType: selectedFilter,
          ),
          ...groupedByLeaveType.values.map(
            (leaves) => LeaveListView(
              leaves: leaves,
              filterType: selectedFilter,
            ),
          ),
        ],
      ),
    );
  }
}

class LeaveListView extends StatefulWidget {
  final List<LeaveModel> leaves;
  final String? filterType;

  const LeaveListView({super.key, required this.leaves, this.filterType});

  @override
  State<LeaveListView> createState() => _LeaveListViewState();
}

class _LeaveListViewState extends State<LeaveListView> {
  final Map<String, Color> leaveTypeColors = {
    LeaveType.Vacation.name: AppColor.primaryBlueColor,
    LeaveType.Sick.name: AppColor.primaryPinkColor,
    LeaveType.Casual.name: AppColor.primaryPurpleColor,
    LeaveType.LeaveEtc.name: AppColor.primaryYellowColor,
  };

  Color getColorForLeaveType(String leaveType) {
    return leaveTypeColors[leaveType] ?? Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final filteredLeaves = widget.filterType == null
        ? widget.leaves
        : widget.leaves
            .where((leave) =>
                Format.statusName(leave.statusID) == widget.filterType)
            .toList();

    ConvertDateTime convert = ConvertDateTime();

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredLeaves.length,
              itemBuilder: (context, index) {
                final leaveData = filteredLeaves[index];
                final ptypeColor =
                    getColorForLeaveType(Format.leaveName(leaveData.type));
                String formattedDate =
                    convert.convertDateEeDdMmm(leaveData.startDate);
                StatusColor statusColors = StatusColor.getColors(
                    Format.statusName(leaveData.statusID));
                return LeaveAllCardOutlineWidget(
                  startDate: formattedDate,
                  totalDay: leaveData.total.toString(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddminLeaveDetailScreen(item: leaveData),
                      ),
                    );
                  },
                  bgColor: statusColors.pbgColor,
                  fontColor: statusColors.pfontColor,
                  status: Format.statusName(leaveData.statusID),
                  title: leaveData.title,
                  firstname: leaveData.firstname,
                  lastname: leaveData.lastname,
                  type: Format.leaveName(leaveData.type),
                  typeColor: ptypeColor,
                  position: leaveData.position,
                  department: leaveData.department,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChips extends HookConsumerWidget {
  final List<String> status;

  const FilterChips({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(selectedFilterProvider);
    return Wrap(
      spacing: 8,
      children: status.map((type) {
        return FilterChip(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
          pressElevation: 0,
          label: FontsStyle(
            text: type,
            color: selectedFilter == type
                ? const Color(0xFF0A84FF)
                : const Color(0xFF8E8E8E),
            weight: FontWeight.w500,
            size: 12,
          ),
          showCheckmark: false,
          selectedColor: const Color(0xFFEAF2FF),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: WidgetStateBorderSide.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const BorderSide(color: Color(0xFFEAF2FF), width: 1.0);
              }
              return const BorderSide(
                  color: AppColor.backgroundColor, width: 1.0);
            },
          ),
          selected: selectedFilter == type,
          onSelected: (bool selected) {
            ref.read(selectedFilterProvider.notifier).state =
                selected ? type : null;
          },
        );
      }).toList(),
    );
  }
}
