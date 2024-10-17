import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../../../utils/constants/colors.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = PSizes.iconLg,
    this.backgroundColor,
    this.borderColor = PColors.borderPrimary,
    this.child,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.gradient,
    this.shadow,
    this.elevation = 0,
    this.useContainerGradient = true,
    this.useGlass = false,
  });
  final double? width, height;
  final double radius;
  final Color borderColor;
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? margin, padding;
  final bool showBorder, useContainerGradient, useGlass;
  final Gradient? gradient;
  final List<BoxShadow>? shadow;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Material(
      type: MaterialType.canvas,
      borderRadius: BorderRadius.circular(radius),
      elevation: elevation,
      child: useGlass
          ? GlassContainer.clearGlass(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              gradient: useContainerGradient
                  ? LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                          PColors.primary.withOpacity(0.3),
                          PColors.primary.withOpacity(0.2),
                          PColors.primary.withOpacity(0.1)
                        ])
                  : gradient,
              borderRadius: BorderRadius.circular(radius),
              color: backgroundColor ?? (isDark ? PColors.dark : PColors.light),
              boxShadow: shadow,
              child: child,
            )
          : Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                  gradient: useContainerGradient
                      ? LinearGradient(
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd,
                          colors: [
                              PColors.primary.withOpacity(0.3),
                              PColors.primary.withOpacity(0.2),
                              PColors.primary.withOpacity(0.1)
                            ])
                      : gradient,
                  borderRadius: BorderRadius.circular(radius),
                  color: backgroundColor ??
                      (isDark ? PColors.dark : PColors.light),
                  border: showBorder ? Border.all(color: borderColor) : null,
                  boxShadow: shadow),
              child: child,
            ),
    );
  }
}
