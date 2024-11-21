import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../../models/user/leave/leave_status_model/leave_status_model.dart';
import '../../../../../providers/app_provider.dart';
import '../../../../../utils/api_constant/api_constant.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/card_outline_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/info_card.dart';
import '../../../../widgets/pdf.widget.dart';

class LeaveDetailScreen extends HookConsumerWidget {
  final LeaveStatusModel item;

  const LeaveDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    final formattedStartDate = convert.convertDateddMMMMyyyy(item.startDate);
    final formattedEndDate = convert.convertDateddMMMMyyyy(item.endDate);

    const String appBarTitle = 'Leave Detail';
    const String idTitleTextForm = "ID";
    const String typeTitleTextForm = "Type of leave";
    const String dateTitleTextForm = "Date";
    const String timeTitleTextForm = "Time";
    const String detailTitleTextForm = "Detail";
    const String approvedTitleTextForm = "Approved By";
    const String imageTitle = "Image/File";
    const String noImage = "-";

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
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCard(
                  status: Format.statusName(item.statusID),
                ),
                const SizedBox(
                  height: 16,
                ),
                CardOutlineWidget(
                    title: idTitleTextForm, detail: item.leaveID.toString()),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: typeTitleTextForm,
                    detail: Format.leaveName(item.type)),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: dateTitleTextForm,
                    detail: "$formattedStartDate - $formattedEndDate"),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: timeTitleTextForm,
                    detail:
                        "${convert.convertTime(item.startTime)} - ${convert.convertTime(item.endTime)} "),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: detailTitleTextForm, detail: item.detail.toString()),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: approvedTitleTextForm, detail: item.approvedBy),
                const SizedBox(
                  height: 8,
                ),
                const FontsStyle(
                    text: imageTitle,
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w100),
                const SizedBox(width: 8),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
