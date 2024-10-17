import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:fintronic/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class KCircularIcon extends StatelessWidget {
  // Custom circular icon with a backgrund

  // properties
  //Container [width, height and backgroundColor]
// Icon [size, color and onPressed]
  const KCircularIcon({
    super.key,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.width,
    this.height,
    required this.onPressed,
    this.size = PSizes.lg,
    this.gradient,
    this.animate = false,
    this.useBadge = false,
    this.animateIcon,
  });

  final IconData icon;
  final AnimateIcons? animateIcon;
  final Color? color, backgroundColor;
  final double? width, height, size;
  final VoidCallback onPressed;
  final Gradient? gradient;
  final bool animate, useBadge;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: gradient,
          color: backgroundColor ??
              (isDark
                  ? PColors.dark.withOpacity(0.9)
                  : PColors.light.withOpacity(0.9)),
          borderRadius: BorderRadius.circular(100)),
      child: animate
          ? Badge(
              smallSize: 8,
              child: AnimateIcon(
                onTap: onPressed,
                iconType: IconType.continueAnimation,
                animateIcon: animateIcon!,
                color: color != null
                    ? color!
                    : isDark
                        ? PColors.dark.withOpacity(0.9)
                        : PColors.light.withOpacity(0.9),
              ),
            )
          : IconButton(
              onPressed: onPressed,
              icon: Badge(
                  smallSize: 8,
                  backgroundColor:
                      useBadge ? PColors.primary : PColors.transparent,
                  alignment: Alignment.topRight,
                  child: Icon(
                    icon,
                    color: color,
                    size: size,
                  )),
            ),
    );
  }
}
