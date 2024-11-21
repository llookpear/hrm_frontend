package com.example.hrm;

import io.flutter.embedding.android.FlutterActivity;


public class MainActivity extends FlutterActivity {
}




//import io.flutter.embedding.android.FlutterActivity;
//import io.flutter.embedding.engine.FlutterEngine;
//import io.flutter.plugin.common.MethodChannel;
//import com.estimote.sdk.BeaconManager;
//import com.estimote.sdk.Beacon;
//import java.util.List;
//
//public class MainActivity extends FlutterActivity {
//    private static final String CHANNEL = "com.example/my_channel";
//    private BeaconManager beaconManager;
//
//    @Override
//    public void configureFlutterEngine(FlutterEngine flutterEngine) {
//        super.configureFlutterEngine(flutterEngine);
//
//        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//                .setMethodCallHandler(
//                        (call, result) -> {
//                            if (call.method.equals("startScanning")) {
//                                startBeaconScanning();
//                                result.success("Scanning started");
//                            } else {
//                                result.notImplemented();
//                            }
//                        }
//                );
//    }
//
//
//}


