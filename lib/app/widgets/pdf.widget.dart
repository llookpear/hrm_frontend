
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_provider.dart';
import '../../utils/style/app_color.dart';
import 'appbar_widget.dart';

class PdfViewerScreen extends ConsumerWidget {
  final String filePDF;

  const PdfViewerScreen({Key? key, required this.filePDF}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfData = ref.watch(getPDFProvider(filePDF));
    return pdfData.when(
      data: (data) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBarWidget(
              title: "Leave Detail",
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
          ),
          body: PDFView(
            filePath: null,
            ///ใช้ Uint8List ในการแสดง PDF
            pdfData: data,
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}