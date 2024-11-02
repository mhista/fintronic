import 'package:fintronic/common/animations/slide_animations/list_slide_animation.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../models/transfer_models.dart';
import 'transfer_to.dart';

class AccountsToTransferList extends StatelessWidget {
  const AccountsToTransferList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Accounts',
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
              final accounts = TransferList.transfer;
              final account = accounts[index];
              return ListSlideAnimation(
                  index: index,
                  itemCount: accounts.length,
                  child: TransferAccountContainer(recent: account));
            },
            seperatorBuilder: (_, index) => const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
            scrollDirection: Axis.vertical,
            itemCount: TransferList.transfer.length),
      ],
    );
  }
}
