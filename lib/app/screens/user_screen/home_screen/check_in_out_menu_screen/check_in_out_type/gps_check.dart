import 'dart:async';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../models/enum.dart';
import '../../../../../../providers/app_provider.dart';
import '../../../../../../utils/style/app_color.dart';
import '../../../../../widgets/check_in_out_time_card_outline_widget.dart';
import '../../../../../widgets/class/convert_datetime_number.dart';
import '../../../../../widgets/class/icons.dart';
import '../../../../../widgets/fonts_style_widget.dart';
import '../../../../../widgets/info_card.dart';
import '../../../../../widgets/slide_button_widget.dart';
import '../../../../../widgets/text_form_field_widget.dart';

class GPSCheckScreenWidget extends ConsumerStatefulWidget {
  const GPSCheckScreenWidget({super.key});

  @override
  GPSCheckScreenWidgetState createState() => GPSCheckScreenWidgetState();
}

class GPSCheckScreenWidgetState extends ConsumerState<GPSCheckScreenWidget> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ConvertDateTime convert = ConvertDateTime();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcons.calendarCore(),
                const SizedBox(
                  width: 4,
                ),
                FontsStyle(
                  text:
                      convert.convertDateddMMMMyyyy(DateTime.now().toString()),
                  color: AppColor.primaryBlueColor,
                  weight: FontWeight.w500,
                  size: 16,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  FluentIcons.clock_16_regular,
                  color: AppColor.primarySuccessColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                FontsStyle(
                    size: 16,
                    text:
                        '${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}:${_currentTime.second.toString().padLeft(2, '0')} ',
                    color: AppColor.primarySuccessColor,
                    weight: FontWeight.w500),
              ],
            ),
            const CheckInOutScreenWidget()
          ],
        ),
      ),
    );
  }
}

class CheckInOutScreenWidget extends HookConsumerWidget {
  const CheckInOutScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String startWorkMessage = "Start work";
    const String endWorkMessage = "End work";
    const String yourLocation = "Your location";
    const String check = "Check";
    Type typeCheck = Type.In;
    TextEditingController locationTextEdit = TextEditingController();
    TextEditingController checkLocation =
        TextEditingController(text: "Checking your current location...");
    final location = ref.watch(locationProvider);
    locationTextEdit.text = location.toString();

    final asyncUserCheckInOutTime = ref.watch(checkInOutTimeProvider);
    return Expanded(
      child: Column(
        children: [
          asyncUserCheckInOutTime.when(
            data: (data) {
              if (data.isEmpty) {
                typeCheck = Type.In;
              } else if (data.isNotEmpty && data.length < 2) {
                typeCheck = Type.Out;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CheckInOutTimeCardOutlineWidget(
                          data: data.isNotEmpty
                              ? convert.convertTime(data[0].time).toString()
                              : startWorkMessage,
                          icon: AppIcons.checkinCore(),
                          title: '$check ${Type.In.name}',
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: CheckInOutTimeCardOutlineWidget(
                          data: data.length > 1
                              ? convert.convertTime(data[1].time).toString()
                              // ? convert.convertTimeHHmm(data[1].time)
                              : endWorkMessage,
                          icon: AppIcons.checkoutCore(),
                          title: '$check ${Type.Out.name}',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        FluentIcons.location_20_regular,
                        color: AppColor.lightGreyColor,
                      ),
                      FontsStyle(
                          text: yourLocation,
                          color: AppColor.lightGreyColor,
                          weight: FontWeight.w100),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormFieldWidget(
                      readOnly: true,
                      controller:
                          location == null ? checkLocation : locationTextEdit),
                  const SizedBox(
                    height: 60,
                  ),
                  data.length > 1
                      ? const SuccessCheckInOutCard()
                      : SlideButton(
                          onPressed: () {
                            ref
                                .read(appProvider)
                                .locationListenerGPS(context, ref, typeCheck);
                          },
                          typeCheck: typeCheck.name,
                        ),
                ],
              );
            },
            loading: () => Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                color: AppColor.primaryYellowColor,
                size: 50,
              ),
            ),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
          // Container(
          //     height: 100,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //           colors: [Colors.pink.shade300, Colors.pink.shade200],
          //           begin: Alignment.centerLeft,
          //           end: Alignment.centerRight,
          //           stops: const [0.3, 0.7]
          //       ),
          //     ),
          //
          //   child: const Padding(
          //     padding: EdgeInsets.all(16.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text(
          //           'Gradient Card',
          //           style: TextStyle(
          //             fontSize: 24,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //           ),
          //         ),
          //         SizedBox(height: 8),
          //         Text(
          //           'This card has a linear gradient background!',
          //           style: TextStyle(color: Colors.white),
          //           textAlign: TextAlign.center,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
