import 'package:flutter/material.dart';

import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class DiscoverInfoWidget extends StatelessWidget {
  const DiscoverInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      height: 200,
      width: 330,
      // backgroundColor: PColors.warning,
      useContainerGradient: false,
      padding: const EdgeInsets.all(0),
      child: Center(
        child: Stack(
          children: [
            const SizedBox.expand(
              child: PRoundedImage(
                borderRadius: 32,
                imageUrl: PImages.vote,
                height: 200,
                width: 330,
                fit: BoxFit.fill,
                usePadding: false,
              ),
            ),
            Container(
              // useContainerGradient: false,
              height: 200,
              width: 330,
              decoration: BoxDecoration(
                  // color: PColors.transparent.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [
                        PColors.dark.withOpacity(0.4),
                        PColors.transparent.withOpacity(0.1)
                      ])),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        '🥇',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        width: PSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        'US Election',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: PColors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 1.4,
                  ),
                  SizedBox(
                    width: 290,
                    child: Text(
                      'Trading the 2024 US Election: Market insight and analysis',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: PColors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
