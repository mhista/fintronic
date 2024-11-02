import 'package:device_preview/device_preview.dart';
import 'package:fintronic/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authentication_repository/authentication_repository.dart';

Future<void> main() async {
  //   Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Init local storage
  await GetStorage.init();
  // Todo: init payment methods
  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Initial firebase and authentication
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  Get.put(AuthenticationRepository());
  // Todo: Initialize Authentication
// Load all the material design / Themes / Localization / Bindings
  // runApp(
  //   DevicePreview(builder: (context) => const MyApp()),
  // );
  runApp(
    const MyApp(),
  );
}

// 
// void additionAndSubtraction(){
   
// }