import 'dart:io';
import 'dart:typed_data';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/payroll_screen/slip_detail_screen/slip_detail_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../../../../../models/enum.dart';
import '../../../../../models/user/payroll/payslip_model/payslip_model.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/fonts_style_widget.dart';

class SlipDetailScreen extends HookConsumerWidget {
  final PaySlipModel item;

  const SlipDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String appBarTitle = 'Slip Detail';
    const String amountTitle = 'Amount';
    const String particularsTitle = 'Particulars';
    const String nameOfID = 'SLIP :';

    ConvertDateTime convert = ConvertDateTime();
    final date = convert.convertDateDdMmYyyy(item.date.toString());
    final month = convert.convertDateMMM(item.date.toString());
    final asyncPayslipDetail = ref.watch(payslipDetailProvider(item.payslipID.toString()));
    final totalState = useState<double>(0);

    void calculateTotal(List data) {
      double total = 0;
      for (var payroll in data) {
        if (Format.slipTypeFromId(payroll.salaryTypeID) == slipType.Earnings) {
          total += payroll.amount;
        } else {
          total -= payroll.amount;
        }
      }
      totalState.value = total;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColor.backgroundColor,
        actionOnPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PdfViewerScreen(
                      payslipID: item.payslipID.toString(),
                    )),
          );
        },
        actionIcons: Icons.save_alt_rounded,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card.filled(
                      color: AppColor.backgroundGreenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          children: [
                            Card.filled(
                              color: AppColor.primaryGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: FontsStyle(
                                      size: 16,
                                      text: month,
                                      color: Colors.white,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            asyncPayslipDetail.when(
                              data: (data) {
                                calculateTotal(data);
                                return FontsStyle(
                                    size: 24,
                                    text: convert
                                        .convertNumberFormat(totalState.value)
                                        .toString(),
                                    color: AppColor.primaryBlueColor,
                                    weight: FontWeight.w600);
                              },
                              loading: () => Center(
                                child: LoadingAnimationWidget.horizontalRotatingDots(color: AppColor.primaryYellowColor, size: 50),
                              ),
                              error: (error, stackTrace) =>
                                  Text('Error: $error'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FontsStyle(
                                      text: '$nameOfID ${item.payslipID}',
                                      color: AppColor.lightGreyColor,
                                      weight: FontWeight.normal),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FontsStyle(
                                        text: date,
                                        color: AppColor.lightGreyColor,
                                        weight: FontWeight.normal),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Card.filled(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Card.filled(
                                color: AppColor.secondaryBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: FontsStyle(
                                        size: 16,
                                        text: particularsTitle,
                                        color: AppColor.primaryBlueColor,
                                        weight: FontWeight.w600,
                                      )),
                                      FontsStyle(
                                          text: amountTitle,
                                          color: AppColor.primaryBlueColor,
                                          weight: FontWeight.normal)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: asyncPayslipDetail.when(
                                data: (data) {
                                  return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      Color pColor;
                                      final payroll = data[index];
                                      if (payroll.salaryTypeID == 1) {
                                        pColor = AppColor.primarySuccessColor;
                                      } else {
                                        pColor = AppColor.primaryCancelColor;
                                      }
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: FontsStyle(
                                                  text: payroll.salaryDetail,
                                                  color: AppColor.darkGreyColor,
                                                  weight: FontWeight.normal,
                                                ),
                                              ),
                                              FontsStyle(
                                                  text: convert.convertNumberFormat(payroll.amount).toString(),
                                                  color: pColor,
                                                  weight: FontWeight.w500),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                loading: () => Center(
                                  child: LoadingAnimationWidget.horizontalRotatingDots(
                                          color: AppColor.primaryYellowColor,
                                          size: 50),
                                ),
                                error: (error, stack) => Text('Error: $error'),
                              )),
                        ),
                      ],
                    ),
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


class PdfViewerScreen extends ConsumerWidget {
  final String payslipID;
  const PdfViewerScreen({Key? key, required this.payslipID}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payslipData = ref.watch(requestPayslipProvider(payslipID));
    return payslipData.when(
      data: (data) {
        if (data != null) {
          return _buildPdfViewer(data);
        } else {
          return const Center(child: Text("No data available"));
        }
      },
      loading: () => LoadingAnimationWidget.horizontalRotatingDots(
        color: AppColor.primaryYellowColor,
        size: 50,
      ),
      error: (error, stackTrace) => Center(child: Text("Error: $error")),
    );
  }

  Widget _buildPdfViewer(Uint8List pdfData) {
    return FutureBuilder<void>(
      future: _savePdf(pdfData),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimationWidget.horizontalRotatingDots(
            color: AppColor.primaryYellowColor,
            size: 50,
          );
        } else {
          return _displayPdf();
        }
      },
    );
  }

  Future<void> _savePdf(Uint8List pdfData) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$payslipID.pdf');
    await file.writeAsBytes(pdfData);
  }

  Future<void> _printPDF(String filePath) async {
    final file = File(filePath);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        final bytes = await file.readAsBytes();
        return bytes;
      },
    );
  }

  Widget _displayPdf() {
    final filePathFuture = getTemporaryDirectory().then((dir) => '${dir.path}/$payslipID.pdf');
    return FutureBuilder<String>(
      future: filePathFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimationWidget.horizontalRotatingDots(
            color: AppColor.primaryYellowColor,
            size: 50,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error loading PDF: ${snapshot.error}"));
        } else {
          final pdfPath = snapshot.data!;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColor.backgroundColor,
            appBar: AppBarWidget(
              title: "PDF Viewer",
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              actionOnPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _printPDF(pdfPath);
                });
              },
              // actionIcons: FluentIcons.print_16_regular
              actionIcons: FluentIcons.print_16_filled
            ),
            body: PDFView(
              filePath: snapshot.data!,
              backgroundColor: Colors.white,
            ),
          );
        }
      },
    );
  }
}
