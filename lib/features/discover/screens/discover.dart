import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/common/widgets/appbar/searchBar.dart';
import 'package:fintronic/common/widgets/images/circular_images.dart';
import 'package:fintronic/common/widgets/images/edge_rounded_images.dart';
import 'package:fintronic/common/widgets/texts/section_heading.dart';
import 'package:fintronic/features/discover/models/crypto_news.dart';
import 'package:fintronic/features/discover/models/discover_chipes.dart';
import 'package:fintronic/features/discover/models/stock_info.dart';
import 'package:fintronic/utils/constants/image_strings.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/containers/rounded_container.dart';
import '../../../common/widgets/layouts/list_layout.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../main/home/widgets/home_appbar.dart';
import 'widgets/discover_chip_list.dart';
import 'widgets/discover_info_widget.dart';
import 'widgets/news_update.dart';
import 'widgets/stock_list.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: HomeAppBar(
        backgroundColor: isDark ? PColors.black : PColors.white,
        containerBgColor: isDark ? PColors.black : PColors.white,
        usesGradient: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: PSizes.spaceBtwItems, horizontal: PSizes.spaceBtwItems),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Discover', style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              // SEARCH BAR
              const MSearchBar(
                hintText: 'Search Stock, Crypto, trends',
                radius: PSizes.iconLg,
                prefixWidget: Icon(IconsaxPlusLinear.search_normal),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              // FILTER LIST
              const DiscoverChipList(),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              // INFORMATION BANNER
              const DiscoverInfoWidget(),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              // STOCK LIST
              const PSectionHeading(title: 'Stock (Top movers)'),
              const StockLIist(),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              // FINANCE NEWS
              const PSectionHeading(title: 'Top News'),
              const NewsUpdate()
            ],
          ),
        ),
      ),
    );
  }
}
