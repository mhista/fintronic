import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appBar.dart';
import '../../../../common/widgets/containers/glass_container.dart';
import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.backgroundColor,
    this.usesGradient = false,
    this.useContainerGradient = false,
    this.containerBgColor,
  });

  final Color? backgroundColor, containerBgColor;
  final bool usesGradient, useContainerGradient;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      useContainerGradient: useContainerGradient,
      backgroundColor: containerBgColor,
      radius: 0,
      // padding: const EdgeInsets.only(
      //   bottom: PSizes.sm,
      // ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: PSizes.sm,
          right: PSizes.sm,
        ),
        child: PAppBar(
          backgroundColor: backgroundColor,
          leadingIcon: KCircularIcon(
            onPressed: () {},
            icon: EvaIcons.grid,
            backgroundColor: usesGradient
                ? isDark
                    ? PColors.light.withOpacity(0.2)
                    : PColors.primary.withOpacity(0.1)
                : isDark
                    ? PColors.dark.withOpacity(0.8)
                    : PColors.light,
            color: usesGradient ? PColors.primary : PColors.primary,
          ),
          actions: [
            TGlassContainer(
              // backgroundColor: PColors.primary.withOpacity(0.15),
              showBorder: true,
              borderColor: PColors.primary.withOpacity(0.1),
              width: 185,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: PSizes.sm / 2,
                  ),
                  KCircularIcon(
                    onPressed: () {},
                    width: 43,
                    height: 43,
                    // animate: true,
                    useBadge: true,
                    icon: Iconsax.notification,
                    color: isDark
                        ? PColors.white.withOpacity(0.6)
                        : PColors.dark.withOpacity(0.6),
                    backgroundColor: usesGradient
                        ? isDark
                            ? PColors.dark
                            : PColors.white.withOpacity(0.6)
                        : PColors.primary.withOpacity(0.1),
                    // backgroundColor: ,
                  ),
                  const SizedBox(
                    width: PSizes.sm / 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'John Deo',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontSizeDelta: -1),
                      ),
                      Text(
                        '@johndeo',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const PRoundedImage(
                    imageUrl: PImages.avatar,
                    width: 40,
                    borderRadius: 100,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(PDeviceUtils.getAppBarHeight() + PSizes.sm);
}
