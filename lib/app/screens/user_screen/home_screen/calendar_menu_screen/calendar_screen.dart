import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:googleapis_auth/auth_io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import '../../../../../models/enum.dart';
import '../../../../../models/user/calendar/calendar_model.dart';
import '../../../../../utils/style/app_color.dart';
import 'calendar_provider.dart';

Future<AutoRefreshingAuthClient> getClient() async {
  /// โหลดมาจาก google api
  final jsonContent = await rootBundle.loadString('assets/calendar/my-calendar-428810-d69de1e06e59.json');
  final credentials = ServiceAccountCredentials.fromJson(jsonDecode(jsonContent));
  final scopes = [calendar.CalendarApi.calendarReadonlyScope];
  return await clientViaServiceAccount(credentials, scopes);
}

///แยกประเภทก่อนแสดงที่ปฏิทิน
Future<List<calendar.Event>> fetchDayOffCalendarFromApi() async {
  try {
    var client = await getClient();
    var calendarApi = calendar.CalendarApi(client);
    /// เอามาจาก google calendar
    var events = await calendarApi.events
        .list('en.th.official#holiday@group.v.calendar.google.com');
    var holidays = events.items?.toList() ?? [];
    var mapHolidays = holidays.map((event) {
      event.extendedProperties =
          event.extendedProperties ?? calendar.EventExtendedProperties();
      event.extendedProperties!.shared =
          event.extendedProperties!.shared ?? <String, String>{};
      event.extendedProperties!.shared!['eventType'] =
          EventType.dayoff.toString();
      return event;
    }).toList();
    return mapHolidays;
  } catch (e) {
    return [];
  }
}

List<DateTime> getDaysInRange(DateTime startDate, DateTime endDate) {
  DateTime utcStartDate = startDate.toUtc();
  DateTime utcEndDate = endDate.toUtc();
  DateTime localStartDate = utcStartDate.toLocal();
  DateTime localEndDate = utcEndDate.toLocal();
  List<DateTime> days = [];
  for (int i = 0; i <= localEndDate.difference(localStartDate).inDays; i++) {
    days.add(DateTime(
        localStartDate.year, localStartDate.month, localStartDate.day + i));
  }
  return days;
}

final dayProvider = FutureProvider<List<CalendarModel>>((ref) async {
  ConvertDateTime con = ConvertDateTime();

  final asyncOTCalendar = await ref.watch(calendarOtProvider.future);
  final asyncDayOffCalendar = await fetchDayOffCalendarFromApi();
  final asyncLeaveCalendar = ref.watch(calendarLeaveProvider);

  const String detailMessage = 'Overtime';
  const String noDetailMessage = 'No detail';

  List<CalendarModel> leaveDay = [];

  asyncLeaveCalendar.when(
    data: (data) {
      for (var leave in data) {
        var dayList = getDaysInRange(leave.startDate, leave.endDate);
        for (var day in dayList) {
          leaveDay.add(CalendarModel(
            date: day,
            startTime: leave.startTime,
            endTime: leave.endTime,
            eventType: EventType.leave.toString(),
            detail: leave.type,
          ));
        }
      }
    },
    loading: () => Center(
      child: LoadingAnimationWidget.horizontalRotatingDots(
        color: AppColor.primaryYellowColor,
        size: 50,
      ),
    ),
    error: (error, stackTrace) => Text('Error: $error'),
  );

  return [
    ...asyncOTCalendar.map((event) {
      final date = con.convertDateYyyyMmDd(event.date.toString());
      return CalendarModel(
        date: date,
        startTime: event.startTime,
        endTime: event.endTime,
        eventType: EventType.ot.toString(),
        detail: detailMessage,
      );
    }),
    ...asyncDayOffCalendar.map((event) {
      final dateTime = event.start?.dateTime;
      final date = dateTime != null
          ? DateTime.utc(dateTime.year, dateTime.month, dateTime.day)
          : (event.start?.date != null
              ? DateTime.utc(event.start!.date!.year, event.start!.date!.month,
                  event.start!.date!.day)
              : DateTime.now());
      return CalendarModel(
        date: date,
        startTime: '00:00:00',
        endTime: '00:00:00',
        eventType: EventType.dayoff.toString(),
        detail: event.summary ?? noDetailMessage,
      );
    }),
    ...leaveDay,
  ];
});

final selectedDateProvider = StateProvider<DateTime?>((ref) => null);
final selectedEventsProvider = StateProvider<List<CalendarModel>>((ref) => []);

class CalendarScreenWidget extends ConsumerWidget {
  const CalendarScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    final dayAsyncValue = ref.watch(dayProvider);
    var selectedDate = ref.watch(selectedDateProvider);
    final selectedEvents = ref.watch(selectedEventsProvider);

    const String dayOff = "Day off";
    const String leave = "Leave";
    const String ot = "OT";
    const String current = "Current";
    const String time = "Time";
    const String event = "Event";

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.backgroundColor,
          body: dayAsyncValue.when(
            data: (events) {
              final Map<DateTime, List<CalendarModel>> eventsByDate = {};
              for (var event in events) {
                final dateCon =
                    convert.convertDateYyyyMmDd(event.date.toString());
                eventsByDate.putIfAbsent(dateCon, () => []).add(event);
              }
              return Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Card.outlined(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.white),
                        // side: const BorderSide(color: AppColor.borderSideColor),
                      ),
                      child: Column(
                        children: [
                          TableCalendar(
                            calendarStyle: const CalendarStyle(
                              outsideTextStyle:
                                  TextStyle(color: AppColor.borderSideColor),
                              selectedDecoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              todayDecoration: BoxDecoration(
                                color: AppColor.primarySuccessColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            calendarBuilders: CalendarBuilders(
                              headerTitleBuilder: (context, date) {
                                return Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        ref
                                            .read(selectedDateProvider.notifier)
                                            .state = DateTime.now();
                                      },
                                      child: const Text(
                                        '',
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 4),
                                          FontsStyle(
                                            text:
                                                DateFormat('MMMM').format(date),
                                            color: AppColor.darkGreyColor,
                                            size: 20,
                                            weight: FontWeight.w600,
                                          ),
                                          FontsStyle(
                                            text:
                                                DateFormat('yyyy').format(date),
                                            color: AppColor.bluishGrayColor,
                                            weight: FontWeight.normal,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          ref
                                              .read(
                                                  selectedDateProvider.notifier)
                                              .state = DateTime.now();
                                        },
                                        icon: const Icon(
                                          FluentIcons.home_16_filled,
                                          color: AppColor.bluishGrayColor,
                                        )),
                                  ],
                                );
                              },
                              markerBuilder: (context, date, events) {
                                if (events.isNotEmpty) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: events.map((event) {
                                      final calendarEvent = event as CalendarModel;
                                      return Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 1.5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: calendarEvent.eventType ==
                                                  EventType.ot.toString()
                                              ? AppColor.primaryBlueColor
                                              : (calendarEvent.eventType ==
                                                      EventType.leave.toString()
                                                  ? AppColor.primaryPendingColor
                                                  : const Color(0xFFC10000)),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }
                                return null;
                              },
                            ),
                            headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                            ),
                            daysOfWeekStyle: const DaysOfWeekStyle(
                              weekdayStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColor.bluishGrayColor,
                              ),
                              weekendStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: AppColor.bluishGrayColor,
                              ),
                            ),
                            firstDay: DateTime(DateTime.now().year - 1),
                            lastDay: DateTime(DateTime.now().year + 2),
                            focusedDay: selectedDate ?? DateTime.now(),
                            selectedDayPredicate: (day) =>
                                isSameDay(day, selectedDate),
                            onDaySelected: (selectedDay, focusedDay) {
                              ref.read(selectedDateProvider.notifier).state =
                                  selectedDay;
                              final dateKey = DateTime.utc(selectedDay.year,
                                  selectedDay.month, selectedDay.day);
                              final eventsForDay = eventsByDate[dateKey] ?? [];
                              ref.read(selectedEventsProvider.notifier).state =
                                  eventsForDay;
                            },
                            eventLoader: (day) {
                              final dateKey =
                                  DateTime.utc(day.year, day.month, day.day);
                              final eventsForDay = eventsByDate[dateKey] ?? [];
                              return eventsForDay;
                            },
                          ),
                          const SizedBox(height: 24),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FontsStyle(
                                text: dayOff,
                                color: AppColor.primaryCancelColor,
                                weight: FontWeight.bold,
                              ),
                              FontsStyle(
                                text: ot,
                                color: AppColor.primaryBlueColor,
                                weight: FontWeight.bold,
                              ),
                              FontsStyle(
                                text: leave,
                                color: AppColor.primaryPendingColor,
                                weight: FontWeight.bold,
                              ),
                              FontsStyle(
                                text: current,
                                color: AppColor.primarySuccessColor,
                                weight: FontWeight.bold,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  if (selectedDate != null)
                    Flexible(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: selectedEvents.length,
                        itemBuilder: (context, index) {
                          var data = selectedEvents[index];
                          return Card.outlined(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              // side: const BorderSide(color: Colors.white),
                            ),
                            color: data.eventType == EventType.ot.toString()
                                ? AppColor.secondaryBlueColor
                                : (data.eventType == EventType.leave.toString()
                                ? AppColor.secondaryPendingColor
                                : AppColor.secondaryCancelColor
                            ),

                            child: Column(
                              children: [
                                ListTile(
                                  title: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        DateFormat('dd').format(data.date),
                                        style: const TextStyle(
                                          fontSize: 28,
                                          color: AppColor.darkGreyColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            DateFormat.E().format(data.date),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColor.darkGreyColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('MMMM yyyy')
                                                .format(data.date),
                                            style: const TextStyle(
                                              color: AppColor.darkGreyColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      const Row(
                                        children: [
                                          Text(
                                            time,
                                            style: TextStyle(
                                              color: AppColor.lightGreyColor,
                                            ),
                                          ),
                                          SizedBox(width: 56),
                                          Text(
                                            event,
                                            style: TextStyle(
                                              color: AppColor.lightGreyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                convert.convertTime(
                                                    data.startTime),
                                                style: const TextStyle(
                                                  color: AppColor.darkGreyColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 14),
                                          Expanded(
                                            child: Card(
                                              // color: AppColor.secondaryPendingColor,
                                              color: Colors.white,
                                              elevation: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  data.detail,
                                                  style: const TextStyle(
                                                    color:
                                                        AppColor.darkGreyColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            },
            loading: () => Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: AppColor.primaryYellowColor, size: 50),
            ),
            error: (error, stack) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
