import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/containers/dropdown_container.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/containers/analytics_info.dart';

class ExchangeRate extends StatelessWidget {
  const ExchangeRate({
    super.key,
    this.isExhange = false,
    required this.title,
    this.subtitle1 = '',
    required this.percentage,
    required this.titleIcon,
    this.exchangeText1 = '',
    this.exchangeText2 = '',
    this.useGradient = false,
    this.isLoss = false,
    required this.dropDownTexts,
  });

  final bool isExhange, useGradient, isLoss;
  final String title, subtitle1, percentage;
  final IconData titleIcon;
  final String exchangeText1, exchangeText2;
  final List dropDownTexts;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return AnalyticsInfoContainer(
        headerIcon: titleIcon,
        isExpanded: false,
        usesGradient: useGradient,
        subtitle1: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                exchangeText1.isEmpty ? subtitle1 : exchangeText1,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(fontSizeDelta: 6),
              ),
              const SizedBox(
                width: PSizes.xs,
              ),
              if (isExhange)
                Row(
                  children: [
                    const Icon(
                      Iconsax.arrow_swap_horizontal,
                      size: 14,
                    ),
                    const SizedBox(
                      width: PSizes.xs,
                    ),
                    Text(
                      exchangeText2,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontSizeDelta: 6),
                    ),
                  ],
                ),
            ],
          ),
        ),
        subtitle2: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              TRoundedContainer(
                backgroundColor: isLoss ? PColors.error.withOpacity(0.2) : null,
                useContainerGradient: isLoss ? false : true,
                width: 25,
                height: 18,
                child: Icon(
                  isLoss ? EvaIcons.trendingDown : EvaIcons.trendingUp,
                  color: isLoss ? PColors.error : PColors.success,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: PSizes.sm / 2,
              ),
              Text(
                isLoss ? '-$percentage% ' : '+$percentage% ',
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: isLoss ? PColors.error : PColors.success,
                    fontWeightDelta: 2),
              ),
            ],
          ),
        ),
        button: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              DropDownContainer(isDark: isDark, dropDownTexts: dropDownTexts),
            ],
          ),
        ),
        headerTitle: title);
  }
}
