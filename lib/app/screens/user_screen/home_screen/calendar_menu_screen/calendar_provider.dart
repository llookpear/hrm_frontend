import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/content_repository.dart';
import '../../../../../models/user/calendar/calendar_model.dart';
import '../../../../../models/user/calendar/leave_calendar_model/leave_calendar_model.dart';

final calendarProvider = Provider<CalendarProvider>((ref) {
  final contentRepository = ref.watch(contentRepositoryProvider);
  return CalendarProvider(contentRepository: contentRepository);
});

class CalendarProvider {
  final ContentRepository _contentRepository;

  CalendarProvider({required ContentRepository contentRepository})
      : _contentRepository = contentRepository;

  Future<List<CalendarModel>> getOTCalendar() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    if (jwtToken != null) {
      final res = await _contentRepository.otCalendar(jwtToken: jwtToken);
      if (res.isComplete) {
        final List<dynamic> jsonData = res.data;
        return jsonData.map((json) => CalendarModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch OT calendar');
      }
    } else {
      throw Exception('Token not found');
    }
  }


  Future<List<LeaveModel>> getLeaveCalendar() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    if (jwtToken != null) {
      final res = await _contentRepository.leaveCalendar(jwtToken: jwtToken);
      if (res.isComplete) {
        print(res.data);
        final List<dynamic> jsonData = res.data;
        return jsonData.map((json) => LeaveModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch OT calendar');
      }
    } else {
      throw Exception('Token not found');
    }
  }
}

final calendarOtProvider = FutureProvider<List<CalendarModel>>((ref) async {
  return await ref.read(calendarProvider).getOTCalendar();
});

final calendarLeaveProvider = FutureProvider<List<LeaveModel>>((ref) async {
  return await ref.read(calendarProvider).getLeaveCalendar();
});
