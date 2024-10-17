import 'package:flutter/material.dart';

import '../../../../common/widgets/buttons/gradient_button.dart';
import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class UrgentNotification extends StatelessWidget {
  const UrgentNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TRoundedContainer(
          height: 115,
          width: 330,
          showBorder: true,
          borderColor: PColors.primary.withOpacity(0.1),
          child: Row(
            children: [
              const PRoundedImage(
                imageUrl: PImages.email,
                backgroundColor: PColors.transparent,
                width: 90,
                // height: 100,
              ),
              SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: PSizes.xs),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //
                      //   ],
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            PTexts.confirmEmail,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: PSizes.xs / 1.5,
                          ),
                          Text(
                            PTexts.confirmEmailSubtitle,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GradientButton(
                            onPressed: () {},
                            height: 40,
                            width: 160,
                            radius: 32,
                            child: Text(
                              'Verify email',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(color: PColors.light),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.cancel_outlined,
              color: PColors.primary.withOpacity(0.8),
              size: 16,
            ),
          ),
        )
      ],
    );
  }
}
