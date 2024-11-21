//
// import 'dart:io';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:upgrader/upgrader.dart';
//
//  //import 'data/local/store_data/store.box.dart';
// // import 'data/local/store_data/system.dart';
//
// class _MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//   }
// }
// class Environment{
//   static setup() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     var r = await Upgrader().initialize();
//     await Upgrader.clearSavedSettings();
//     HttpOverrides.global = _MyHttpOverrides();
//     // await initHiveBox();
//     return;
//   }
// }
//
//

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upgrader/upgrader.dart';

import 'data/local/store_data/store.box.dart';
import 'data/local/store_data/system.dart';

class _MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
class Environment{
  static setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    var r = await Upgrader().initialize();
    await Upgrader.clearSavedSettings();
    HttpOverrides.global = _MyHttpOverrides();
    await initHiveBox();
    return;
  }
}

Future<void> initHiveBox({bool justOpenBox = false}) async {
  try{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocDir.path)
      ..registerAdapter<StoreSystemData>(StoreSystemDataAdapter());
    Box<StoreSystemData>? _systemBox;
    if (!Hive.isBoxOpen(systemBox)) _systemBox = await Hive.openBox<StoreSystemData>(systemBox);
    if ((_systemBox?.isEmpty ?? false)) await _systemBox!.add(StoreSystemData());
  }catch(e){
  }
}
