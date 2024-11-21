import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../../models/admin/leave_model/leave_model.dart';
import '../../../../../models/enum.dart';
import '../../../../../providers/app_provider.dart';
import '../../../../../utils/api_constant/api_constant.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/approve_reject_button_widget.dart';
import '../../../../widgets/card_outline_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/info_card.dart';
import '../../../../widgets/pdf.widget.dart';
import '../admin_leave_provider.dart';

class AddminLeaveDetailScreen extends HookConsumerWidget {
  final LeaveModel item;

  const AddminLeaveDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    final formattedStartDate = convert.convertDateddMMMMyyyy(item.startDate);
    final formattedEndDate = convert.convertDateddMMMMyyyy(item.endDate);
    final formattedStartTime = convert.convertTime(item.startTime);
    final formattedEndTime = convert.convertTime(item.endTime);
    const String noImage = "-";

    const String appBarTitle = "Leave Detail";
    const String leavetypeMessage = "Type of Leave";
    const String dateMessage = "Date";
    const String startTimeMessage = "Start Time";
    const String detailMessage = "Detail";
    const String imageMessage = "Image/File";

    String getFileExtension(String fileName) {
      return fileName.split('.').last.toLowerCase();
    }

    bool isImageFile(String fileName) {
      final ext = getFileExtension(fileName);
      return ['jpg', 'jpeg', 'png', 'gif'].contains(ext);
    }

    bool isPdfFile(String fileName) {
      final ext = getFileExtension(fileName);
      return ext == 'pdf';
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () => Navigator.pop(context),
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(
                    status: Format.statusName(item.statusID),
                  ),
                  const SizedBox(height: 20),
                  CardOutlineWidget(
                    title: leavetypeMessage,
                    detail: Format.leaveName(item.type),
                  ),
                  const SizedBox(height: 8),
                  CardOutlineWidget(
                    title: dateMessage,
                    detail: "$formattedStartDate - $formattedEndDate",
                  ),
                  const SizedBox(height: 8),
                  CardOutlineWidget(
                    title: startTimeMessage,
                    detail: "$formattedStartTime - $formattedEndTime",
                  ),
                  const SizedBox(height: 8),
                  CardOutlineWidget(
                    title: detailMessage,
                    detail: item.detail,
                  ),
                  const SizedBox(height: 8),
                  const FontsStyle(
                      text: imageMessage,
                      color: AppColor.lightGreyColor,
                      weight: FontWeight.w100),
                  const SizedBox(width: 14),
                  if (isImageFile(item.file))
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: OctoImage(
                        errorBuilder: (_, __, ___) => const FontsStyle(
                            text: "-",
                            color: Colors.black,
                            weight: FontWeight.normal),
                        image: CachedNetworkImageProvider(
                            APIConstance.getImage(item.file)),
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (isPdfFile(item.file))
                    ClipRRect(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(5, 5),
                        backgroundColor: AppColor.primaryBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PdfViewerScreen(filePDF: item.file),
                          ),
                        );
                      },
                      child: const Icon(
                        FluentIcons.document_16_filled,
                        size: 20,
                        color: Colors.white,
                      ),
                    ))
                  else
                    const FontsStyle(
                        text: noImage,
                        color: AppColor.darkGreyColor,
                        weight: FontWeight.normal),
                  const SizedBox(
                    height: 20,
                  ),
                  if (Format.statusName(item.statusID) ==
                      StatusName.Request.name) ...[
                    const Spacer(),
                    ApproveRejectButtonWidget(
                      onPressedReject: () async {
                        Navigator.pop(context);
                        await ref.read(allLeaveProvider).approveLeave(
                              item.leaveID.toString(),
                              Format.statusID(StatusName.Cancel).toString(),
                              context,
                            );
                      },
                      onPressedApprove: () async {
                        Navigator.pop(context);
                        await ref.read(allLeaveProvider).approveLeave(
                              item.leaveID.toString(),
                              Format.statusID(StatusName.Confirm).toString(),
                              context,
                            );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
