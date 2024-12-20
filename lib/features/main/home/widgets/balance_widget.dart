import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/common/widgets/icons/glass_icon.dart';
import 'package:fintronic/features/main/home/anime.dart';
import 'package:fintronic/features/main/transaction/request/screens/request_money.dart';
import 'package:fintronic/features/main/transaction/transfer/screens/transfer.dart';
import 'package:fintronic/features/personalization/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../common/widgets/containers/glass_container.dart';
import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final accountController = Get.put(AccountController());
    return TRoundedContainer(
      // elevation: 0.6,
      useContainerGradient: false,
      padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
      height: 240,
      // width: 330,
      backgroundColor: PColors.primary.withOpacity(0.05),
      child: Column(
        children: [
          // BALANCE INFORMATION
          Padding(
            padding: const EdgeInsets.only(left: PSizes.spaceBtwSections),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Available Balance',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      width: PSizes.sm,
                    ),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          debugPrint(
                              accountController.hideBalance.value.toString());
                          accountController.hideBalance.value =
                              !accountController.hideBalance.value;
                        },
                        child: Icon(
                          !accountController.hideBalance.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                          size: 17,
                        ),
                      );
                    })
                  ],
                ),
                const SizedBox(
                  height: PSizes.sm,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Text(
                        !accountController.hideBalance.value
                            ? '\$10,155'
                            : '*****',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .apply(fontSizeDelta: -2),
                      );
                    }),
                    Obx(() {
                      return Text(
                        !accountController.hideBalance.value ? '.00' : '',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .apply(color: PColors.darkGrey.withOpacity(0.7)),
                      );
                    }),
                    const SizedBox(
                      width: PSizes.sm,
                    ),
                    // TGlassContainer(
                    //   height: 25,
                    //   width: 65,
                    //   radius: 32,
                    //   showBorder: true,
                    //   borderColor: PColors.transparent,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Text('USDT',
                    //           style: Theme.of(context).textTheme.bodyLarge!),
                    //       const Icon(
                    //         Iconsax.arrow_down_1,
                    //         size: 16,
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
                const SizedBox(
                  height: PSizes.sm,
                ),
                Obx(() {
                  return accountController.hideBalance.value
                      ? Row(
                          children: [
                            Text(
                              '******',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(fontWeightDelta: 2),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '(+12.50%) ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      color: PColors.success,
                                      fontWeightDelta: 2),
                            ),
                            Text(
                              ' since last month',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        );
                })
              ],
            ),
          ),
          const SizedBox(
            height: PSizes.spaceBtwSections * 1.5,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: PSizes.spaceBtwSections),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    KGlassIcon(
                        color: PColors.darkGrey,
                        icon: IconsaxPlusLinear.money_add,
                        onPressed: () {}),
                    const SizedBox(
                      height: PSizes.sm,
                    ),
                    Text(
                      'Deposit',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                          color: isDark
                              ? PColors.light.withOpacity(0.7)
                              : PColors.dark.withOpacity(0.6)),
                    )
                  ],
                ),
                const SizedBox(
                  width: PSizes.md,
                ),
                Column(
                  children: [
                    KGlassIcon(
                        color: PColors.darkerGrey,
                        icon: Iconsax.money_send,
                        onPressed: () => Get.to(() => const TransferScreen())),
                    const SizedBox(
                      height: PSizes.sm,
                    ),
                    Text('Transfer',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: isDark
                                ? PColors.light.withOpacity(0.7)
                                : PColors.dark.withOpacity(0.6)))
                  ],
                ),
                const SizedBox(
                  width: PSizes.md,
                ),
                Column(
                  children: [
                    KGlassIcon(
                        color: PColors.success.withOpacity(0.8),
                        icon: Iconsax.money_recive,
                        onPressed: () => Get.to(() => const RequestMoney())),
                    const SizedBox(
                      height: PSizes.sm,
                    ),
                    Text('Request',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: isDark
                                ? PColors.light.withOpacity(0.7)
                                : PColors.dark.withOpacity(0.6)))
                  ],
                ),
                const SizedBox(
                  width: PSizes.md,
                ),
                Column(
                  children: [
                    KGlassIcon(
                        color: PColors.success,
                        icon: Iconsax.money_change,
                        onPressed: () => Get.to(() => const AnimationScreen())),
                    const SizedBox(
                      height: PSizes.sm,
                    ),
                    Text('Convert',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: isDark
                                ? PColors.light.withOpacity(0.7)
                                : PColors.dark.withOpacity(0.6)))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
