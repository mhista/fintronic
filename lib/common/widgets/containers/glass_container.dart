import 'package:flutter/material.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../../../utils/constants/colors.dart';

class TGlassContainer extends StatelessWidget {
  const TGlassContainer({
    super.key,
    this.width,
    this.height,
    this.radius = PSizes.iconLg,
    this.borderColor,
    this.child,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.gradient,
    this.shadow,
    this.elevation = 0,
  });
  final double? width, height;
  final double radius;
  final Color? borderColor;
  final Widget? child;
  final EdgeInsetsGeometry? margin, padding;
  final bool showBorder;
  final Gradient? gradient;
  final List<BoxShadow>? shadow;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      gradient: gradient,
      borderRadius: BorderRadius.circular(radius),
      borderColor: showBorder ? borderColor : null,
      boxShadow: shadow,
      child: child,
    );
  }
}
