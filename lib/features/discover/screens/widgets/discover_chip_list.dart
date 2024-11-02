import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../models/discover_chipes.dart';

class DiscoverChipList extends StatelessWidget {
  const DiscoverChipList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return SizedBox(
      // color: PColors.error,
      height: 60,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final chips = ChipList.discoverChips;
            final data = chips[index];
            return FilterChip(
                backgroundColor: isDark ? PColors.dark : PColors.light,
                side: BorderSide.none,
                avatarBorder: Border.all(width: 0),
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(PSizes.iconLg)),
                label: Row(
                  children: [
                    Text(data.icon),
                    const SizedBox(
                      width: PSizes.spaceBtwItems / 2,
                    ),
                    Text(
                      data.description,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                onSelected: (value) {});
          },
          separatorBuilder: (_, index) => const SizedBox(
                width: PSizes.spaceBtwItems / 1.5,
              ),
          itemCount: ChipList.discoverChips.length),
    );
  }
}
