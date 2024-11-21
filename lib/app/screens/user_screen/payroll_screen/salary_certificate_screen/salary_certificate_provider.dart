import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hrm_project/data/repositories/request_repository.dart';
import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/content_repository.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/format.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/snackbar_widget.dart';
import '../salary_certificate_status_screen/salary_certificate_status_provider.dart';


final salaryCertificateProvider = Provider<SalaryCertificateProvider>((ref) {
  final requestRepository = ref.read(requestRepositoryProvider);
  final contentRepository = ref.read(contentRepositoryProvider);
  return SalaryCertificateProvider(
      contentRepository: contentRepository,
      requestRepository: requestRepository,
      ref: ref);
});

class SalaryCertificateProvider {
  final RequestRepository _requestRepository;
  final Ref _ref;

  SalaryCertificateProvider({
    required RequestRepository requestRepository,
    required ContentRepository contentRepository,
    required Ref ref,
  })  : _requestRepository = requestRepository,
        _ref = ref;


  // Future <List<DepartmentModel>> department() async {
  //   var res = await _contentRepository.department();
  //   if (res.isComplete) {
  //     List<dynamic> jsonData = res.data;
  //     List<DepartmentModel> data = jsonData.map((json) =>
  //         DepartmentModel.fromJson(json)).toList();
  //     return data;
  //   } else {
  //     throw Exception('Failed to fetch leave quota');
  //   }
  // }
  Future<void> salaryCertificate(String dateStamp, BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _requestRepository.salaryCertificateRequest(
        jwtToken: jwtToken.toString(),
        statusID: Format.statusID(StatusName.Request),
        dateStamp: dateStamp,
        createdAt: ConvertDateTime.createdAt,);
    if (res.isComplete) {
      var refresh = _ref.refresh(certificateProvider);
         refresh;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarSuccessWidget(
            message: 'Your request has been submitted',
          ),
        );
      }
    }
    else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarFailedWidget(
            message: 'Failed to submit your request',
          ),
        );
      }
    }
  }
}
