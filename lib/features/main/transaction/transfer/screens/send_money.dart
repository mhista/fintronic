import 'package:fintronic/common/widgets/appbar/searchBar.dart';
import 'package:fintronic/common/widgets/buttons/gradient_button.dart';
import 'package:fintronic/common/widgets/containers/rounded_container.dart';
import 'package:fintronic/common/widgets/images/edge_rounded_images.dart';
import 'package:fintronic/features/main/transaction/transfer/screens/widgets/accounts_list.dart';
import 'package:fintronic/utils/constants/image_strings.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'widgets/receipt.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

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
        title: const Text('Send Money'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            Text(
              'Enter amount',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(fontSizeDelta: 1),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 1.3,
            ),
            Center(
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.displayMedium!.apply(
                          // color: isDark
                          //     ? PColors.light.withOpacity(0.8)
                          //     : PColors.dark.withOpacity(0.8),
                          ),
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          prefixText: '\$ ',
                          prefixStyle:
                              Theme.of(context).textTheme.displayMedium!.apply(
                                    color: isDark
                                        ? PColors.light.withOpacity(0.6)
                                        : PColors.dark.withOpacity(0.6),
                                  ),
                          hintText: '100.00',
                          hintStyle:
                              Theme.of(context).textTheme.displayMedium!.apply(
                                    color: isDark
                                        ? PColors.light.withOpacity(0.4)
                                        : PColors.dark.withOpacity(0.4),
                                  ),
                          border: const UnderlineInputBorder().copyWith(
                              borderSide: BorderSide(
                                  color: isDark
                                      ? PColors.lightGrey
                                      : PColors.grey)),
                          enabledBorder: const UnderlineInputBorder().copyWith(
                              borderSide: BorderSide(
                                  color: isDark
                                      ? PColors.lightGrey
                                      : PColors.grey)),
                          focusedBorder: const UnderlineInputBorder().copyWith(
                              borderSide: const BorderSide(
                                  width: 1, color: PColors.dark)),
                          errorBorder: const UnderlineInputBorder().copyWith(
                              borderSide: const BorderSide(
                                  width: 1, color: PColors.warning)),
                          focusedErrorBorder:
                              const UnderlineInputBorder()
                                  .copyWith(
                                      borderSide: const BorderSide(
                                          width: 1, color: PColors.warning))),
                    ),
                  )
                ],
              )),
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections * 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PSizes.spaceBtwItems / 1.5,
                  horizontal: PSizes.spaceBtwItems / 1.5),
              child: TRoundedContainer(
                height: 150,
                intensity: 0,
                useContainerGradient: false,
                backgroundColor:
                    isDark ? PColors.accent : PColors.primary.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(
                    vertical: PSizes.spaceBtwItems,
                    horizontal: PSizes.spaceBtwItems),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const PRoundedImage(
                              imageUrl: PImages.profile1,
                              width: 40,
                              borderRadius: 100,
                              height: 40,
                            ),
                            const SizedBox(
                              width: PSizes.spaceBtwItems / 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Robert Fox',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(
                                  height: PSizes.spaceBtwItems / 2.4,
                                ),
                                Text(
                                  '8789838309',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          fontSizeDelta: 2,
                                          fontWeightDelta: 1,
                                          letterSpacingDelta: 0.5),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            showDragHandle: false,
                            builder: (context) => const SingleChildScrollView(
                                child: Padding(
                              padding: EdgeInsets.all(PSizes.spaceBtwItems),
                              child: AccountsToTransferList(),
                            )),
                          ),
                          child: TRoundedContainer(
                            useContainerGradient: false,
                            width: 70,
                            radius: 32,
                            height: 40,
                            child: Center(
                                child: Text(
                              'Change',
                              style: Theme.of(context).textTheme.headlineSmall,
                            )),
                          ),
                        )
                      ],
                    ),
                    MSearchBar(
                      // maxLines: 3,
                      // minLines: 1,
                      hintText: 'Add note',
                      radius: 32,
                      useBorder: false,
                      useSuffix: true,
                      useSearch: false,
                      suffixWidget: SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                padding: const EdgeInsets.all(0),
                                icon: const Icon(Icons.emoji_emotions_outlined),
                                onPressed: () {}),
                            IconButton(
                                padding: const EdgeInsets.all(0),
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                icon: const Icon(IconsaxPlusLinear.gift),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections * 2,
            ),
            GradientButton(
              onPressed: () => Get.to(() => const ReceiptScreen()),
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
    );
  }
}
