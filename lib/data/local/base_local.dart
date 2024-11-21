import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hrm_project/data/local/store_data/store.box.dart';
import 'package:hrm_project/data/local/store_data/system.dart';
import 'package:location/location.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BaseLocalRepository {
  late StoreSystemData systemData;
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosDeviceInfo;

  BaseLocalRepository() {
    /// System
    var _systemBox = Hive.box<StoreSystemData>(systemBox);
    systemData = _systemBox.getAt(0) ?? StoreSystemData();
  }

  Future<String?> getUniqueID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final storage = FlutterSecureStorage();
    String? uuid = await storage.read(key: "uuid");
    if ((uuid ?? "").isNotEmpty) return uuid;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = this.androidInfo ?? (await deviceInfo.androidInfo);
      this.androidInfo = androidInfo;
      uuid = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = iosDeviceInfo ?? (await deviceInfo.iosInfo);
      iosDeviceInfo = iosInfo;
      uuid = iosInfo.identifierForVendor ?? '';
    }
    await storage.write(key: "uuid", value: uuid ?? "");
    return uuid;
  }

  Future<String> getSystemName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = this.androidInfo ?? (await deviceInfo.androidInfo);
      this.androidInfo = androidInfo;
      return androidInfo.version.codename;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = iosDeviceInfo ?? (await deviceInfo.iosInfo);
      iosDeviceInfo = iosInfo;
      return iosInfo.systemName;
    }
    throw ("Can't get 'UniqueID' for this device");
  }

  Future<String> getSystemVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = this.androidInfo ?? (await deviceInfo.androidInfo);
      this.androidInfo = androidInfo;
      return androidInfo.version.baseOS ?? '';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = iosDeviceInfo ?? (await deviceInfo.iosInfo);
      iosDeviceInfo = iosInfo;
      return iosInfo.systemVersion;
    }
    throw ("Can't get 'UniqueID' for this device");
  }

  Future<String> getDeviceModel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = this.androidInfo ?? (await deviceInfo.androidInfo);
      this.androidInfo = androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = iosDeviceInfo ?? (await deviceInfo.iosInfo);
      iosDeviceInfo = iosInfo;
      return iosInfo.model;
    }
    throw ("Can't get 'UniqueID' for this device");
  }

  Future<LocationData?> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData? _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return _locationData;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return _locationData;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<String> getVersion() async {
    try {
      var res = await PackageInfo.fromPlatform();
      return res.version;
    } catch (e) {
      return "-";
    }
  }

  Future<String> getBuildNumber() async {
    try {
      var res = await PackageInfo.fromPlatform();
      return res.buildNumber;
    } catch (e) {
      return "-";
    }
  }

  Future<String> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.device;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.name;
    }
    throw ("Can't get 'UniqueID' for this device");
  }

}
