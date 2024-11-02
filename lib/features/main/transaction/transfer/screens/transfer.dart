import 'package:fintronic/common/animations/slide_animations/list_slide_animation.dart';
import 'package:fintronic/common/widgets/appbar/searchBar.dart';
import 'package:fintronic/common/widgets/containers/rounded_container.dart';
import 'package:fintronic/common/widgets/icons/circular_icon.dart';
import 'package:fintronic/common/widgets/images/edge_rounded_images.dart';
import 'package:fintronic/common/widgets/layouts/list_layout.dart';
import 'package:fintronic/features/main/transaction/transfer/models/transfer_models.dart';
import 'package:fintronic/features/main/transaction/transfer/screens/send_money.dart';
import 'package:fintronic/utils/constants/colors.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'widgets/accounts_list.dart';
import 'widgets/transfer_to.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        leading: KCircularIcon(
          icon: Icons.arrow_back,
          onPressed: () => Get.back(),
          color: isDark ? PColors.light : PColors.dark.withOpacity(0.8),
          backgroundColor: PColors.transparent,
        ),
        title: const Text('Transfer Money'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: PSizes.spaceBtwSections / 2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: MSearchBar(
                      hintText: 'Search',
                      radius: 32,
                      prefixWidget: Icon(IconsaxPlusLinear.search_favorite),
                    ),
                  ),
                  const SizedBox(width: PSizes.spaceBtwItems / 1.5),
                  KCircularIcon(icon: IconsaxPlusLinear.sort, onPressed: () {})
                ],
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // RECENT TRANSFER
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          fontSizeDelta: 2,
                          fontWeightDelta: 2,
                        ),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  ListLayout(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final recents = TransferList.transfer
                            .where((transfer) => transfer.isRecent == true)
                            .toList();
                        final recent = recents[index];
                        return TransferAccountContainer(recent: recent);
                      },
                      seperatorBuilder: (_, index) => const SizedBox(
                            height: PSizes.spaceBtwItems,
                          ),
                      scrollDirection: Axis.vertical,
                      itemCount: TransferList.transfer
                          .where((transfer) => transfer.isRecent == true)
                          .toList()
                          .length)
                ],
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // ACCOUNTS TO TRANSFER TO
              const AccountsToTransferList()
            ],
          ),
        ),
      ),
    );
  }
}
