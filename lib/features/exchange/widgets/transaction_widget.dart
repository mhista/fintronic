import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    this.width = 100,
    this.height = 65,
    this.radius = 10,
  });
  final double width, height, radius;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TRoundedContainer(
              width: width,
              height: height,
              radius: radius,
              backgroundColor: isDark ? PColors.dark : PColors.light,
              useContainerGradient: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(IconsaxPlusLinear.wallet_money),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Deposit',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: !isDark ? PColors.dark : PColors.light,
                        ),
                  )
                ],
              )),
          TRoundedContainer(
              width: width,
              height: height,
              radius: radius,
              backgroundColor: isDark ? PColors.dark : PColors.light,
              useContainerGradient: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(IconsaxPlusLinear.wallet_minus),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Withdraw',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: !isDark ? PColors.dark : PColors.light,
                        ),
                  )
                ],
              )),
          TRoundedContainer(
              useGlass: true,
              width: width,
              height: height,
              radius: radius,
              // elevation: 2,
              backgroundColor: isDark ? PColors.dark : PColors.light,
              useContainerGradient: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    IconsaxPlusLinear.money_change,
                    // color: PColors.primary,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Transfer',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: !isDark ? PColors.dark : PColors.light,
                        ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
