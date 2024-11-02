import 'package:fintronic/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:fintronic/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class PSettingsMenuTile extends StatelessWidget {
  const PSettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle = '',
      this.trailing,
      this.onTap,
      this.addSubtitle = true,
      this.addSpacing = false});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool addSubtitle;
  final bool addSpacing;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      useContainerGradient: false,
      backgroundColor: PColors.transparent,
      borderColor: PColors.grey.withOpacity(0.3),
      margin: const EdgeInsets.only(bottom: PSizes.spaceBtwInputFields),
      showBorder: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TRoundedContainer(
                useContainerGradient: false,
                backgroundColor: PColors.transparent,
                borderColor: PColors.grey.withOpacity(0.3),
                height: 48,
                width: 48,
                margin: const EdgeInsets.all(2),
                showBorder: true,
                child: Icon(
                  icon,
                  size: 20,
                  // color: PColors.primary,
                ),
              ),
              const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
              // onTap: onTap,
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(fontWeightDelta: -1),
              ),
            ],
          ),

          Row(
            children: [
              if (trailing != null) trailing!,
              if (trailing == null)
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              const SizedBox(
                width: PSizes.sm,
              ),
            ],
          )
          // subtitle: addSubtitle
          //     ? Text(
          //         title,
          //         style: Theme.of(context).textTheme.labelMedium,
          //       )
          //     : null,
          // if (addSpacing)
        ],
      ),
    );
  }
}
