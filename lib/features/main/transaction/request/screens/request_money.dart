import 'package:currency_picker/currency_picker.dart';
import 'package:fintronic/common/widgets/containers/rounded_container.dart';
import 'package:fintronic/common/widgets/images/edge_rounded_images.dart';
import 'package:fintronic/utils/constants/image_strings.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../../common/loaders/loaders.dart';
import '../../../../../common/widgets/buttons/gradient_button.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'widgets/request_money_form.dart';

class RequestMoney extends StatelessWidget {
  const RequestMoney({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        leading: KCircularIcon(
          icon: Icons.arrow_back,
          onPressed: () => Get.back(),
          color: isDark ? PColors.light : PColors.dark.withOpacity(0.8),
          backgroundColor: PColors.transparent,
        ),
        title: const Text('Request Money'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwItems),
          child: Column(
            children: [
              const RequestMoneyForm(),
              const SizedBox(
                height: PSizes.spaceBtwSections * 2,
              ),
              GradientButton(
                onPressed: () => showPaymentSummary(context),
                height: 50,
                radius: 32,
                child: Text(
                  'Continue',
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

  Future<dynamic> showPaymentSummary(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints(minHeight: 350, maxHeight: 350),
      showDragHandle: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            TRoundedContainer(
              useContainerGradient: false,
              backgroundColor: PColors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const PRoundedImage(
                        imageUrl: PImages.avatar,
                        borderRadius: 100,
                        width: 60,
                        height: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: PSizes.spaceBtwItems,
                          ),
                          Text(
                            '100\$',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {},

                      // => showCurrencyPicker(
                      //     context: context,
                      //     onSelect: (value) {},
                      //     theme: CurrencyPickerThemeData(
                      //         bottomSheetHeight:
                      //             PHelperFunctions.screenHeight() / 2)),
                      child: TRoundedContainer(
                          useContainerGradient: false,
                          width: 80,
                          height: 40,
                          radius: 10,
                          child: Row(
                            children: [
                              const PRoundedImage(
                                imageUrl: PImages.us,
                                imageHeight: 25,
                                imageWidth: 25,
                                borderRadius: 100,
                              ),
                              Text(
                                'USD',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(fontSizeDelta: 1),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: PrettyQrView.data(
                      data: 'lorem Ipsum',
                      // sha
                      decoration: const PrettyQrDecoration(
                        shape: PrettyQrSmoothSymbol(
                            color: PrettyQrBrush.gradient(
                                gradient: PColors.generalGradient)),
                        image: PrettyQrDecorationImage(
                          image: AssetImage(PImages.profile10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: PSizes.spaceBtwItems,
                  ),
                  const Flexible(
                    child: Text(
                      'fintronic/request/bci73eybddb873',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Clipboard.getData('fintronic/request/bci73eybddb873');
                      // Get.back();
                      // PLoaders.customToast(message: 'Copied to clipboard');
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Copy link',
                          style: TextStyle(color: PColors.secondary),
                        ),
                        SizedBox(
                          width: PSizes.xs,
                        ),
                        Icon(
                          Iconsax.copy,
                          size: 14,
                          color: PColors.secondary,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            Row(
              children: [
                Expanded(
                  child: GradientButton(
                    onPressed: () {},
                    useContainerGradient: false,
                    backgroundColor: PColors.transparent,
                    showBorder: true,
                    height: 50,
                    radius: 32,
                    child: Text(
                      'Cancel Request',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          // color: PColors.light,
                          fontWeightDelta: 2,
                          fontSizeDelta: 2
                          //     ? PColors.light.withOpacity(0.8)
                          //     : PColors.dark.withOpacity(0.8),
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: PSizes.xs,
                ),
                Expanded(
                  child: GradientButton(
                    onPressed: () {},
                    height: 50,
                    radius: 32,
                    child: Text(
                      'Send Request',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: PColors.light,
                          fontWeightDelta: 2,
                          fontSizeDelta: 2
                          //     ? PColors.light.withOpacity(0.8)
                          //     : PColors.dark.withOpacity(0.8),
                          ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
