import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fintronic/utils/constants/colors.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:fintronic/utils/device/device_utility.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';

import '../../../utils/helpers/helper_functions.dart';

class MSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const MSearchBar(
      {super.key,
      this.color,
      required this.hintText,
      this.useSuffix = false,
      this.useBorder = true,
      this.hasColor = false,
      this.radius,
      this.suffixWidget,
      this.textController,
      this.usePrefixSuffix = false,
      this.onChanged,
      this.prefixWidget,
      this.focusNode,
      this.onTap,
      this.minLines,
      this.maxLines,
      this.useSearch = true});

  // to add the background color to tabs, wrap with material widget.
  final Color? color;
  final String hintText;
  final bool useSuffix, useBorder, hasColor, usePrefixSuffix, useSearch;
  final double? radius;
  final Widget? suffixWidget, prefixWidget;
  final TextEditingController? textController;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int? minLines, maxLines;

  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return TextFormField(
      // expands: true,
      minLines: minLines,
      maxLines: maxLines,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChanged,
      controller: textController,
      decoration: InputDecoration(
          fillColor: hasColor
              ? color
              : isDark
                  ? PColors.black
                  : PColors.white,
          filled: true,
          contentPadding: useSuffix
              ? const EdgeInsets.symmetric(vertical: 15, horizontal: 10)
              : const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelMedium,
          suffixIcon: useSuffix || usePrefixSuffix
              ? suffixWidget ?? SearchIcon(isDark: isDark)
              : null,
          prefixIcon: !useSearch
              ? null
              : !useSuffix
                  ? prefixWidget
                  : SearchIcon(isDark: isDark),
          border: inputBorder(isDark, useBorder, radius),
          focusedBorder: inputBorder(isDark, useBorder, radius),
          enabledBorder: inputBorder(isDark, useBorder, radius)),
    );
  }

  OutlineInputBorder inputBorder(bool isDark, bool useBorder, double? radius) {
    return OutlineInputBorder(
      borderSide: useBorder
          ? BorderSide(
              color: isDark ? PColors.grey.withOpacity(0.2) : PColors.grey)
          : BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 14.0),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Icon(
        Iconsax.search_normal_1,
        size: 20,
        // color: isDark ? PColors.black : PColors.white,

        // color: Colors.white,
      ),
    );
  }
}
