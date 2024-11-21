import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import 'package:hrm_project/app/widgets/class/icons.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';
import '../app/widgets/elevated_button_widget.dart';
import '../app/widgets/info_card.dart';
import '../app/widgets/text_form_field_widget.dart';
import '../data/local/store_data/store.box.dart';
import '../data/local/store_data/system.dart';
import '../data/repositories/content_repository.dart';
import '../data/repositories/home_repository.dart';
import '../models/enum.dart';
import '../models/user/branch/branch_model.dart';
import '../models/user/check_in_out/check_in_out_time_model/check_in_out_time_model.dart';
import '../routing/app_router.dart';
import '../routing/router.dart';
import '../utils/format.dart';
import '../utils/style/app_color.dart';

final locationProvider = StateProvider<String?>((ref) => null);

ConvertDateTime convert = ConvertDateTime();
final appProvider = Provider<AppProvider>((ref) {
  final homeProvider = ref.read(homeRepositoryProvider);
  final contentRepository = ref.read(contentRepositoryProvider);
  return AppProvider(
    homeRepository: homeProvider,
    contentRepository: contentRepository,
    ref: ref,
  );
});

class Location {
  late final double distanceInMeters;
  late final String location;

  Location(this.distanceInMeters, this.location);
}

class AppProvider {
  String cancelButton = "Cancel";
  String confirmButton = "Confirm";
  String yourLocation = "Your location";
  String successMessage = "Success";
  String yourDistance = "Your distance";
  String meters = "Meters";
  final HomeRepository _homeRepository;
  final Ref _ref;

  List<BranchModel> _branch = [];

  AppProvider({
    required Ref ref,
    required HomeRepository homeRepository,
    required ContentRepository contentRepository,
  })  : _homeRepository = homeRepository,
        _ref = ref;

  void init(var permission) {
    var userPermission = permission;
    var u = Hive.box<StoreSystemData>(systemBox).getAt(0)!;
    if (u.accessToken != null && userPermission == UserPermission.user.name) {
      _ref.read(routerProvider).go(AppRouter().homeScreen);
    } else if (u.accessToken != null &&
        userPermission == UserPermission.admin.name) {
      _ref.read(routerProvider).go(AppRouter().addminHomeMenuScreenWidget);
    } else {
      ///เพิ่ม alert dialog
      _ref.watch(routerProvider).go(AppRouter().loginScreen);
    }
  }

  Future<List<BranchModel>> branch() async {
    try {
      var res = await _homeRepository.branch();
      _branch = res.data ?? [];
      return _branch;
    } catch (e) {
      return [];
    }
  }

  double checkLocationMeter(double latitude, double longitude) {
    return Geolocator.distanceBetween(
        /// fix branch
        latitude,
        longitude,
        _branch[0].lat,
        _branch[0].lng);
  }

  Future<void> locationListenerGPS(
      BuildContext context, WidgetRef ref, Type typeOfCheck) async {
    StreamSubscription<Position>? positionStream;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return;
    }
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) async {
      double distanceInMeters =
          checkLocationMeter(position.latitude, position.longitude);
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placeMarks[0];
      String location =
          "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}";
      ref.read(locationProvider.notifier).state = location;
      TextEditingController tecLocation = TextEditingController();
      TextEditingController tecDistance = TextEditingController();
      tecLocation.text = location;
      tecDistance.text = "${distanceInMeters.toStringAsFixed(2)} $meters";
      if (distanceInMeters <= _branch[0].locationDistance) {
        positionStream?.cancel();
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            DateTime currentTime = DateTime.now();
            return AlertDialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.3,
              ),
              content: Column(
                children: [
                  FontsStyle(
                      size: 20,
                      text: "Check ${typeOfCheck.name}",
                      color: AppColor.darkGreyColor,
                      weight: FontWeight.w600),
                  const SizedBox(height: 8),
                  FontsStyle(
                    text: convert
                        .convertDateddMMMMyyyy(DateTime.now().toString()),
                    color: AppColor.primaryBlueColor,
                    weight: FontWeight.normal,
                  ),
                  const SizedBox(height: 8),
                  FontsStyle(
                      text: DateFormat('hh:mm a').format(currentTime),
                      color: AppColor.primarySuccessColor,
                      weight: FontWeight.w500),
                  const SizedBox(height: 8),
                  InfoCardCanCheck(
                    data: typeOfCheck.name.toLowerCase(),
                  ),
                  // const Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Icon(
                  //       FluentIcons.location_20_regular,
                  //       color: AppColor.lightGreyColor,
                  //     ),
                  //     FontsStyle(
                  //         text: 'Your location',
                  //         color: AppColor.lightGreyColor,
                  //         weight: FontWeight.w100),
                  //   ],
                  // ),
                  // const SizedBox(height: 4),
                  // TextFormFieldWidget(controller: tecLocation, readOnly: true),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
              actions: <Widget>[
                Row(
                  children: [
                    ElevatedButtonWidget(
                      btColor: AppColor.cancelButtonColor,
                      title: cancelButton,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButtonWidget(
                      title: confirmButton,
                      onPressed: () {
                        /// fix ID
                        checkInOut(
                            Format.getCheckType(CheckType.GPS, typeOfCheck),
                            position.latitude.toString(),
                            position.longitude.toString(),
                            "");
                        Navigator.of(context).pop();
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.of(context).pop();
                            });
                            return AlertDialog(
                              insetPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.3,
                              ),
                              surfaceTintColor: Colors.white,
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppIcons.checkSquareStatusCore(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  FontsStyle(
                                      size: 16,
                                      text: successMessage,
                                      color: AppColor.darkGreyColor,
                                      weight: FontWeight.w600),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FontsStyle(
                                      text:
                                          "Check ${typeOfCheck.name} Successful",
                                      color: AppColor.lightGreyColor,
                                      weight: FontWeight.normal),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
      } else if (distanceInMeters > _branch[0].locationDistance) {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            DateTime currentTime = DateTime.now();
            return AlertDialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.symmetric(
                // horizontal: 30, vertical: 200
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.2,
              ),
              contentPadding: const EdgeInsets.all(24),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FontsStyle(
                        size: 20,
                        text: "Check ${typeOfCheck.name}",
                        color: AppColor.darkGreyColor,
                        weight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: FontsStyle(
                      text: convert
                          .convertDateddMMMMyyyy(DateTime.now().toString()),
                      color: AppColor.primaryBlueColor,
                      weight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Row(
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
                            text: DateFormat('hh:mm a').format(currentTime),
                            color: AppColor.primarySuccessColor,
                            weight: FontWeight.w500),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  InfoCardWarningCheck(
                    data: typeOfCheck.name.toString(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontsStyle(
                          text: yourDistance,
                          color: AppColor.lightGreyColor,
                          weight: FontWeight.w100),
                    ],
                  ),
                  TextFormFieldWidget(controller: tecDistance, readOnly: true),
                ],
              ),
              actions: <Widget>[
                Row(
                  children: [
                    ElevatedButtonWidget(
                      btColor: AppColor.cancelButtonColor,
                      title: cancelButton,
                      onPressed: () {
                        positionStream?.cancel();
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButtonWidget(
                      title: confirmButton,
                      onPressed: () {
                        positionStream?.cancel();
                        checkInOut(
                            Format.getCheckType(CheckType.GPS, typeOfCheck),
                            position.latitude.toString(),
                            position.longitude.toString(),
                            "");
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }
    });
  }

  Future<void> scanningBeacon(
      BuildContext context, WidgetRef ref, Type typeOfCheck) async {
    StreamSubscription<RangingResult>? streamRanging;
    final List<Beacon> beacons = [];
    Timer? scanTimer;
    await flutterBeacon.initializeScanning;
    final region = Region(
      /// fix branch
      identifier: _branch[0].identifier,
      proximityUUID: _branch[0].uuid,
    );
    streamRanging =
        flutterBeacon.ranging([region]).listen((RangingResult result) async {
      // _beacons.clear();
      beacons.addAll(result.beacons);
      for (var beacon in result.beacons) {
        if (beacon.proximityUUID == region.proximityUUID) {
          streamRanging?.cancel();
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              DateTime currentTime = DateTime.now();
              return AlertDialog(
                insetPadding: EdgeInsets.symmetric(
                  // horizontal: 30, vertical: 200
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.3,
                ),
                surfaceTintColor: Colors.white,
                content: Column(
                  children: [
                    FontsStyle(
                        size: 20,
                        text: "Check ${typeOfCheck.name}",
                        color: AppColor.darkGreyColor,
                        weight: FontWeight.w600),
                    const SizedBox(height: 8),
                    FontsStyle(
                      text: convert
                          .convertDateddMMMMyyyy(DateTime.now().toString()),
                      color: AppColor.primaryBlueColor,
                      weight: FontWeight.normal,
                    ),
                    const SizedBox(height: 8),
                    FontsStyle(
                        text: DateFormat('hh:mm a').format(currentTime),
                        color: AppColor.primarySuccessColor,
                        weight: FontWeight.w500),
                    const SizedBox(height: 8),
                    InfoCardCanCheck(
                      data: typeOfCheck.name.toLowerCase(),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Row(
                    children: [
                      ElevatedButtonWidget(
                        btColor: AppColor.cancelButtonColor,
                        title: cancelButton,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButtonWidget(
                        title: confirmButton,
                        onPressed: () {
                          checkInOut(
                              Format.getCheckType(
                                  CheckType.Beacon, typeOfCheck),
                              "",
                              "",
                              beacon.proximityUUID);
                          Navigator.of(context).pop();
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.of(context).pop();
                              });
                              return AlertDialog(
                                insetPadding: EdgeInsets.symmetric(
                                  // horizontal: 50, vertical: 250
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1,
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.3,
                                ),
                                surfaceTintColor: Colors.white,
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppIcons.checkSquareStatusCore(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    FontsStyle(
                                        size: 16,
                                        text: successMessage,
                                        color: AppColor.darkGreyColor,
                                        weight: FontWeight.w600),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    FontsStyle(
                                        text:
                                            "Check ${typeOfCheck.name} Successful",
                                        color: AppColor.lightGreyColor,
                                        weight: FontWeight.normal),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        }
      }
    });
    scanTimer = Timer(const Duration(seconds: 20), () {
      streamRanging?.cancel();
      beacons.clear();
    });
  }

  Future<void> checkInOut(
    String checkTypeID,
    String latitude,
    String longitude,
    String uuid,
  ) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _homeRepository.checkInOut(
      jwtToken: jwtToken.toString(),
      date: ConvertDateTime.dateNow,
      time: ConvertDateTime.timeNow,
      checkTypeID: checkTypeID,
      uuid: uuid,
      latitude: latitude,
      longitude: longitude,
      createdAt: ConvertDateTime.createdAt,
    );
    if (res.isComplete) {
      var refresh = _ref.refresh(checkInOutTimeProvider);
      refresh;
    } else {}
  }

  Future<List<CheckInOutTimeModel>> getCheckInOutTime() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _homeRepository.checkInOutTime(
        jwtToken: jwtToken.toString(), date: ConvertDateTime.dateNow);
    return res.data!;
  }

  Future<Uint8List> getPDF(String filename) async {
    var res = await _homeRepository.getPDF(
      filename: filename,
    );
    return res.data;
  }
}

final branchProvider = FutureProvider<List<BranchModel>>((ref) async {
  List<BranchModel> branches = await ref.read(appProvider).branch();
  return branches;
});

final checkInOutTimeProvider =
    FutureProvider.autoDispose<List<CheckInOutTimeModel>>((ref) async {
  return await ref.read(appProvider).getCheckInOutTime();
});

final getPDFProvider = FutureProvider.family
    .autoDispose<Uint8List?, String>((ref, filename) async {
  var value = await ref.read(appProvider).getPDF(filename);
  return value;
});

// final getImageProvider = FutureProvider.family<String, String>((ref, filename) async {
//   var value = await ref.read(appProvider).getImage(filename);
//   return value;
// });
