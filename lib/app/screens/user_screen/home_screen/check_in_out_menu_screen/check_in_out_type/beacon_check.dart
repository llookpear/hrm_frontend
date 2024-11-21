import 'dart:async';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../models/enum.dart';
import '../../../../../../providers/app_provider.dart';
import '../../../../../../utils/style/app_color.dart';
import '../../../../../widgets/check_in_out_time_card_outline_widget.dart';
import '../../../../../widgets/class/icons.dart';
import '../../../../../widgets/fonts_style_widget.dart';
import '../../../../../widgets/info_card.dart';

class BeaconCheckScreenWidget extends ConsumerStatefulWidget {
  const BeaconCheckScreenWidget({super.key});

  @override
  BeaconCheckScreenWidgetState createState() => BeaconCheckScreenWidgetState();
}

class BeaconCheckScreenWidgetState
    extends ConsumerState<BeaconCheckScreenWidget>
    with SingleTickerProviderStateMixin {
  Timer? scanTimer;
  bool _isScanning = false;
  late Timer _timer;
  late AnimationController _controller;

  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void _startScanning() {
    if (_isScanning) return;
    setState(() {
      _isScanning = true;
    });
    _startAnimation();
    scanTimer = Timer(const Duration(seconds: 20), () {
      _controller.stop();
      setState(() {
        _isScanning = false;
      });
    });
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Type typeCheck = Type.In;
    final asyncUserCheckInOutTime = ref.watch(checkInOutTimeProvider);
    const String startWorkMessage = "Start work";
    const String endWorkMessage = "End work";
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
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
                    text: convert
                        .convertDateddMMMMyyyy(DateTime.now().toString()),
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
                    width: 5,
                  ),
                  FontsStyle(
                      size: 16,
                      text:
                          '${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}:${_currentTime.second.toString().padLeft(2, '0')} ',
                      color: AppColor.primarySuccessColor,
                      weight: FontWeight.w500),
                ],
              ),
              asyncUserCheckInOutTime.when(
                data: (data) {
                  if (data.isEmpty) {
                    typeCheck = Type.In;
                  } else if (data.isNotEmpty && data.length < 2) {
                    typeCheck = Type.Out;
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CheckInOutTimeCardOutlineWidget(
                              data: data.isNotEmpty
                                  ? convert.convertTime(data[0].time).toString()
                                  // ? convert.convertTimeHHmm(data[0].time)
                                  : startWorkMessage,
                              icon: AppIcons.checkinCore(),
                              title: 'Check ${Type.In.name}',
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
                              title: 'Check ${Type.Out.name}',
                            ),
                          )
                        ],
                      ),
                      data.length > 1
                          ? const Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                SuccessCheckInOutCard(),
                              ],
                            )
                          : CustomPaint(
                              painter: SpritePainter(_controller),
                              child: SizedBox(
                                width: screenSize.width * 0.9,
                                height: screenSize.height * 0.4,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    _startScanning();
                                    ref.read(appProvider).scanningBeacon(
                                        context, ref, typeCheck);
                                  },
                                  icon: const Icon(
                                    Icons.bluetooth,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = Color.fromRGBO(0, 100, 200, opacity);
    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);
    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
