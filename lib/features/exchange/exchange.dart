import 'package:fintronic/common/widgets/texts/section_heading.dart';
import 'package:fintronic/features/analytics/screens/widgets/chart.dart';
import 'package:fintronic/features/analytics/screens/widgets/leaderboards.dart';
import 'package:fintronic/features/exchange/widgets/crypto_data.dart';
import 'package:fintronic/features/main/home/widgets/home_appbar.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../common/widgets/containers/rounded_container.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/crypto_chart.dart';
import 'widgets/transaction_widget.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // final innerBoxIsScrolled = true;
    return Scaffold(
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
      backgroundColor: PColors.transparent,
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
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
                    // const TRoundedContainer(
                    //   radius: 0,
                    //   child:
                    // ),
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
                          child: CryptoChartWidget(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            const TransactionWidget(),
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: CryptoPriceData(),
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
