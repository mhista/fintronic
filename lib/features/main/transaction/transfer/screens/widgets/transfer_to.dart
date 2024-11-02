import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../models/transfer_models.dart';
import '../send_money.dart';

class TransferAccountContainer extends StatelessWidget {
  const TransferAccountContainer({
    super.key,
    required this.recent,
  });

  final TransferMade recent;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const SendMoney()),
      child: TRoundedContainer(
        padding: const EdgeInsets.symmetric(vertical: PSizes.sm),
        useContainerGradient: recent.isSelected ? true : false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PRoundedImage(
                  imageUrl: recent.profilePics,
                  imageWidth: 50,
                  imageHeight: 50,
                  borderRadius: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: PSizes.xs,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recent.accountName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: PSizes.xs / 1.3,
                    ),
                    Text(
                      recent.accountNumber,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            KCircularIcon(
              icon: IconsaxPlusBold.star,
              onPressed: () {},
              color: recent.isFavorite
                  ? PColors.primary
                  : isDark
                      ? PColors.grey
                      : PColors.grey,
              backgroundColor: PColors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
