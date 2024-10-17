import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/common/widgets/icons/circular_icon.dart';
import 'package:fintronic/features/main/analytics/analytics.dart';
import 'package:fintronic/features/main/discover/discover.dart';
import 'package:fintronic/features/main/exchange/exchange.dart';
import 'package:fintronic/features/main/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:fintronic/utils/constants/colors.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';

import 'features/main/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            backgroundColor: isDark ? PColors.black : PColors.white,
            indicatorColor: isDark
                ? PColors.white.withOpacity(0.0)
                : PColors.black.withOpacity(0.0),
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: [
              const NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'Home',
                selectedIcon: Icon(Iconsax.home5),
              ),
              const NavigationDestination(
                  selectedIcon: Icon(EvaIcons.pieChart),
                  icon: Icon(EvaIcons.pieChartOutline),
                  label: 'Analytics'),
              NavigationDestination(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: KCircularIcon(
                      onPressed: () {},
                      width: 50,
                      height: 50,
                      icon: Iconsax.activity,
                      gradient: PColors.generalGradient,
                      color: PColors.light,
                    ),
                  ),
                  label: ''),
              const NavigationDestination(
                  icon: Icon(
                    Iconsax.global,
                  ),
                  selectedIcon: Icon(
                    Iconsax.global5,
                  ),
                  label: 'Discover'),
              const NavigationDestination(
                icon: Icon(Iconsax.user),
                label: 'Profile',
                selectedIcon: Icon(EvaIcons.person),
              ),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const AnalyticsScreen(),
    const ExchangeScreen(),
    const DiscoverScreen(),
    const ProfileScreen()
  ];
}
