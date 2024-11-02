import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/containers/analytics_info.dart';
import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';

class AnalyticsInfoWidget extends StatelessWidget {
  const AnalyticsInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnalyticsInfoContainer(
        usesGradient: true,
        headerIcon: Iconsax.activity,
        subtitle1: Row(
          children: [
            Text(
              '\$34,000,',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(fontSizeDelta: 6),
            )
          ],
        ),
        subtitle2: Row(
          children: [
            Text(
              '+12.50% ',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: PColors.success, fontWeightDelta: 2),
            ),
          ],
        ),
        button: const TRoundedContainer(
          child: Row(),
        ),
        headerTitle: 'Goal Achieved');
  }
}
