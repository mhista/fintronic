import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class RequestMoneyForm extends StatelessWidget {
  const RequestMoneyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send Payment Request to',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recipients name'),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Name', prefixIcon: Icon(Iconsax.user)),
            )
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwInputFields,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recipients email'),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'example@mail.com',
                  prefixIcon: Icon(Icons.mail_outline)),
            )
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwInputFields,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Amount'),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.money),
                hintText: '100',
                // prefixIcon: Icon(Iconsax.dollar_circle),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () => showCurrencyPicker(
                        context: context,
                        onSelect: (value) {},
                        theme: CurrencyPickerThemeData(
                            bottomSheetHeight:
                                PHelperFunctions.screenHeight() / 2)),
                    child: const TRoundedContainer(
                        useContainerGradient: false,
                        width: 70,
                        height: 30,
                        radius: 10,
                        child: Row(
                          children: [
                            PRoundedImage(
                              imageUrl: PImages.us,
                              imageHeight: 25,
                              imageWidth: 25,
                              borderRadius: 100,
                            ),
                            Icon(Icons.arrow_drop_down_sharp)
                          ],
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwInputFields,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Add a note'),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            TextFormField(
              minLines: 4,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: 'few notes to be delivered with invoice..',
                  hintStyle: const TextStyle().copyWith(
                      fontSize: 14,
                      color: isDark
                          ? PColors.light.withOpacity(0.4)
                          : PColors.dark.withOpacity(0.4))),
            )
          ],
        ),
      ],
    ));
  }
}
