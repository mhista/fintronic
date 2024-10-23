import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:fintronic/features/authentication/screens/onboarding/onboarding.dart';
import 'package:fintronic/utils/theme/theme.dart';

import 'bindings/general_bindings.dart';
import 'utils/constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: PColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
