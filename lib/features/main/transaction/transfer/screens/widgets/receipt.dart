import 'package:fintronic/common/styles/spacing_styles.dart';
import 'package:fintronic/common/widgets/images/edge_rounded_images.dart';
import 'package:fintronic/common/widgets/texts/section_heading.dart';
import 'package:fintronic/navigation_menu.dart';
import 'package:fintronic/utils/constants/image_strings.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:fintronic/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/buttons/gradient_button.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../models/receipt_model.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction = transactionReceipt;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SuccessAnimationWidget(),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  Text(
                    'Payment Successful',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  Text(
                    'Your payment was successful. Email confirmation sent',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  const SharePrintButtons(),
                ],
              ),
              // SHARE BUTTON
              const SizedBox(
                height: PSizes.spaceBtwSections * 1.5,
              ),

              // TRANSACTION DETAILS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction Details',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(fontSizeDelta: -4),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 1.5,
                  ),
                  TransactionDetailRows(
                      title: 'Transaction Number',
                      subtitle: transaction.transactionNumber),
                  TransactionDetailRows(
                      title: 'Transaction Date',
                      subtitle: PFormatter.formatDate(transaction.date)),
                  TransactionDetailRows(
                    title: 'Recipient',
                    subtitle: transaction.recipient,
                    addImage: true,
                  ),
                  TransactionDetailRows(
                      title: 'Amount',
                      subtitle: '\$${transaction.payment.toString()}'),
                  TransactionDetailRows(
                      title: 'Charge',
                      subtitle: '\$${transaction.charge.toString()}'),
                  TransactionDetailRows(
                      title: 'Total Payment',
                      subtitle: '\$${transaction.total.toString()}'),
                ],
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              GradientButton(
                onPressed: () => Get.offAll(() => const NavigationMenu()),
                height: 50,
                radius: 32,
                child: Text(
                  'Back to home',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: PColors.light, fontWeightDelta: 2, fontSizeDelta: 2
                      //     ? PColors.light.withOpacity(0.8)
                      //     : PColors.dark.withOpacity(0.8),
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionDetailRows extends StatelessWidget {
  const TransactionDetailRows({
    super.key,
    required this.title,
    required this.subtitle,
    this.addImage = false,
  });
  final String title, subtitle;
  final bool addImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(fontWeightDelta: -1),
            ),
            Row(
              children: [
                if (addImage)
                  const PRoundedImage(
                    imageUrl: PImages.profile1,
                    height: 20,
                    width: 20,
                    borderRadius: 100,
                  ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(fontWeightDelta: -1),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        )
      ],
    );
  }
}

class SharePrintButtons extends StatelessWidget {
  const SharePrintButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 0.8,
                      color: isDark ? PColors.dark : PColors.light,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.share),
                    const SizedBox(width: 10),
                    Text(
                      'Share',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            fontWeightDelta: -1,
                          ),
                    )
                  ],
                )),
          ),
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 0.8,
                      color: isDark ? PColors.dark : PColors.light,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.print),
                    const SizedBox(width: 10),
                    Text(
                      'Print',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            fontWeightDelta: -1,
                          ),
                    )
                  ],
                )),
          ),
        )
      ],
    );
  }
}

class SuccessAnimationWidget extends StatelessWidget {
  const SuccessAnimationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: TRoundedContainer(
          borderWidth: 0.1,
          showBorder: true,
          height: 125,
          width: 125,
          radius: 100,
          useContainerGradient: false,
          backgroundColor: PColors.transparent,
          borderColor: PColors.primary.withOpacity(0.3),
          child: const Stack(
            children: [
              Center(
                child: TRoundedContainer(
                  height: 100,
                  width: 100,
                  radius: 100,
                  gradient: PColors.generalGradient,
                  useContainerGradient: false,
                  child: Stack(
                    children: [
                      Center(
                        child: TRoundedContainer(
                          height: 50,
                          width: 50,
                          borderWidth: 5,
                          showBorder: true,
                          borderColor: PColors.light,
                          radius: 100,
                          useContainerGradient: false,
                          backgroundColor: PColors.transparent,
                        ),

                        // child: Icon(),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Icon(
                          Icons.done_rounded,
                          color: PColors.light,
                          size: 50,
                          weight: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      // ),
      // const Positioned(
      //   child:
      // ),
    ]);
  }
}
