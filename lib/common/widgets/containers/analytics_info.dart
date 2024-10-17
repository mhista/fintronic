import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'rounded_container.dart';
import '../icons/circular_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class AnalyticsInfoContainer extends StatelessWidget {
  const AnalyticsInfoContainer({
    super.key,
    required this.headerIcon,
    this.isExpanded = false,
    this.usesGradient = false,
    required this.subtitle1,
    required this.subtitle2,
    required this.button,
    required this.headerTitle,
  });

  final IconData headerIcon;
  final String headerTitle;
  final bool isExpanded, usesGradient;
  final Widget subtitle1, subtitle2, button;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(8),
      width: 160,
      height: 160,
      useContainerGradient: usesGradient,
      useGlass: true,
      // showBorder: false,
      elevation: !usesGradient
          ? isDark
              ? 2
              : 0
          : 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment:
            // MainAxisAlignment.spaceAround,
            children: [
              KCircularIcon(
                width: 33,
                height: 33,
                icon: headerIcon,
                onPressed: () {},
                color: PColors.primary,
                backgroundColor: PColors.white.withOpacity(0.3),
                size: 18,
              ),
              const SizedBox(
                width: PSizes.sm / 2,
              ),
              Text(
                headerTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(fontSizeDelta: 0),
              ),
            ],
          ),
          const SizedBox(
            height: PSizes.sm / 1.5,
          ),
          subtitle1,
          const SizedBox(
            height: PSizes.sm / 2,
          ),
          subtitle2,
          const SizedBox(
            height: PSizes.sm / 2,
          ),
          const Divider(
            thickness: 0.5,
            indent: 7,
            endIndent: 7,
          ),
          button
        ],
      ),
    );
  }
}
