import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class KGlassIcon extends StatelessWidget {
  // Custom circular icon with a backgrund

  // properties
  //Container [width, height and backgroundColor]
// Icon [size, color and onPressed]
  const KGlassIcon({
    super.key,
    required this.icon,
    this.color,
    this.radius = 100,
    this.width = 50,
    this.height = 50,
    required this.onPressed,
    this.size = PSizes.lg,
    this.gradient,
    this.animate = false,
    this.useBadge = false,
    this.animateIcon,
  });

  final IconData icon;
  final AnimateIcons? animateIcon;
  final Color? color;
  final double? width, height, size;
  final double radius;
  final VoidCallback onPressed;
  final Gradient? gradient;
  final bool animate, useBadge;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return GlassContainer.clearGlass(
      width: width,
      height: height,
      gradient: gradient,
      borderColor: PColors.transparent,
      borderRadius: BorderRadius.circular(radius),
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
