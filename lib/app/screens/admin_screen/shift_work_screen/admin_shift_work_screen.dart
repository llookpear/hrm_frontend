import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/admin_screen/shift_work_screen/admin_shift_work_provider.dart';
import 'package:hrm_project/app/widgets/class/status_color.dart';
import '../../../../models/admin/shift_work_model/shift_work_model.dart';
import '../../../../models/enum.dart';
import '../../../../utils/format.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/class/convert_datetime_number.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/admin_shift_all_card_outline_widget.dart';
import 'admin_shift_work_detail_screen/admin_shift_work_detail_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddminShiftWorkScreenWidget extends StatelessWidget {
  const AddminShiftWorkScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AddminShiftWorkScreenWidget();
  }
}

class _AddminShiftWorkScreenWidget extends HookConsumerWidget {
  const _AddminShiftWorkScreenWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String appBarTitle = " Shift Work";

    final asyncShiftWorkProvider = ref.watch(shiftWorkProvider);
    final shiftList = asyncShiftWorkProvider.value;
    if (shiftList == null) {
      return Center(
        child: LoadingAnimationWidget.horizontalRotatingDots(
            color:AppColor.primaryYellowColor, size: 50),
      );
    }
    final List<TabNameAdmin> tabNames = TabNameAdmin.values.toList();
    tabNames.map((tab) => Tab(text: Format.getTabNameAdminDisplay(tab))).toList();

    var tabController = useTabController(
      initialLength: tabNames.length,
    );
    final groupedByShiftType = {
      for (var status in tabNames.where((status) => status != TabNameAdmin.All))
        status: shiftList
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
        backgroundColor:AppColor.backgroundColor,
        title: const Row(
          children: [
            FontsStyle(
                text: appBarTitle,
                color: AppColor.darkGreyColor,
                weight: FontWeight.w600),
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
                    labelColor:  AppColor.darkGreyColor,
                    unselectedLabelColor: AppColor.lightGreyColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    controller: tabController,
                    tabs: tabNames.map((tab) =>
                            Tab(text: Format.getTabNameAdminDisplay(tab))).toList(),
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
          ShiftListView(shift: shiftList),
          ...groupedByShiftType.values.map(
            (shift) => ShiftListView(shift: shift),
          ),
        ],
      ),
    );
  }
}

class ShiftListView extends StatefulWidget {
  final List<AdminShiftWorkModel> shift;

  const ShiftListView({super.key, required this.shift});

  @override
  State<ShiftListView> createState() => _ShiftListViewState();
}

class _ShiftListViewState extends State<ShiftListView> {
  ConvertDateTime convert = ConvertDateTime();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.shift.length,
              itemBuilder: (context, index) {
                final data = widget.shift[index];
                Color pbgColor;
                Color pfontColor;
                final colors =
                    StatusColor.getColors(Format.statusName(data.statusID));
                pbgColor = colors.pbgColor;
                pfontColor = colors.pfontColor;
                String formattedDate = convert.convertDateEeDdMmm(data.date);
                String desiredShiftTime = convert.convertTime(data.desiredShiftTime);
                String currentShiftTime = convert.convertTime(data.requestingShiftTime);
                return AdminShiftAllCardOutlineWidget(
                  status: Format.statusName(data.statusID),
                  date: formattedDate,
                  requestingName: data.requestingName,
                  desiredName: data.desiredName,
                  currentName: data.requestingName,
                  desiredTime: desiredShiftTime,
                  currentTime: currentShiftTime,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddminShiftWorkDetailScreen(item: data),
                      ),
                    );
                  },
                  bgColor: pbgColor,
                  fontColor: pfontColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
