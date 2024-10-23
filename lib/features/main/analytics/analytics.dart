import 'package:fintronic/common/widgets/texts/section_heading.dart';
import 'package:fintronic/features/main/analytics/screens/widgets/chart.dart';
import 'package:fintronic/features/main/analytics/screens/widgets/leaderboards.dart';
import 'package:fintronic/features/main/home/widgets/home_appbar.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import 'screens/widgets/exchange_rate.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // final innerBoxIsScrolled = true;
    return Scaffold(
      backgroundColor: PColors.transparent,
      appBar: const HomeAppBar(
        backgroundColor: PColors.transparent,
        useContainerGradient: true,

        //       const SystemUiOverlayStyle(
        //   systemNavigationBarColor: PColors.dark,
        //   systemNavigationBarIconBrightness: Brightness.dark,
        //   statusBarIconBrightness: Brightness.dark,
        //   // statusBarColor: PColors.dark,
        //   statusBarBrightness: Brightness.dark,
        // ),
        // usesGradient: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: TRoundedContainer(
                backgroundColor: isDark ? PColors.black : PColors.white,
                useContainerGradient: false,
                radius: 15,
                elevation: 0.1,
                child: Column(
                  children: [
                    // APP BAR

                    // ANALYTICS CHART
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            TRoundedContainer(
                              backgroundColor:
                                  isDark ? PColors.black : PColors.white,
                              height: PHelperFunctions.screenHeight() / 4,
                              radius: 0,
                              // useContainerGradient: false,
                            ),
                            TRoundedContainer(
                              backgroundColor:
                                  isDark ? PColors.black : PColors.white,
                              height: PHelperFunctions.screenHeight() / 7,
                              radius: 15,
                              useContainerGradient: false,
                              // elevation: 2,
                            ),
                          ],
                        ),
                        const Positioned(
                          top: 20,
                          left: 15,
                          right: 15,
                          child: ChartColumnWidget(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Exchange Rate
                      const ExchangeRate(
                        title: 'Exchange Rate',
                        subtitle1: '',
                        percentage: '18.09',
                        isExhange: true,
                        exchangeText1: '\$1.00',
                        exchangeText2: '\$1.00',
                        titleIcon: Iconsax.convert,
                        isLoss: true,
                        dropDownTexts: [
                          'USD',
                          'EUR',
                          'GBP',
                        ],
                      ),
                      ExchangeRate(
                        title: 'Net Income',
                        subtitle1: '\$14,000',
                        percentage: '12.24',
                        titleIcon: Iconsax.chart,
                        useGradient: isDark ? false : true,
                        dropDownTexts: const [
                          'JAN',
                          'FEB',
                          'MAR',
                          'APR',
                          'MAY',
                          'JUN',
                          'JUL',
                          'AUG',
                          'SEP',
                          'OCT',
                          'NOV',
                          'DEC',
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: LeaderBoard(),
                )
              ],
            ),

            // TRANSACTION LEADERBBOARD
          ],
        ),
      ),
    );
  }
}
