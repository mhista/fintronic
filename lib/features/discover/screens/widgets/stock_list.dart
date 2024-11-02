import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/images/circular_images.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/stock_info.dart';

class StockLIist extends StatelessWidget {
  const StockLIist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListLayout(
          itemBuilder: (_, index) {
            final stocks = StockInfoList.stockInfo;
            final stock = stocks[index];
            return TRoundedContainer(
              height: 110,
              width: 140,
              useContainerGradient: false,
              padding: const EdgeInsets.symmetric(
                  vertical: PSizes.sm, horizontal: PSizes.md),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PCircularImage(
                      imageUrl: stock.image,
                      padding: PSizes.sm,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    Text(
                      stock.companyName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          EvaIcons.trendingUpOutline,
                          color: PColors.success,
                          size: 16,
                        ),
                        const SizedBox(
                          width: PSizes.sm / 3,
                        ),
                        Text(
                          '\$${stock.stockPrice} (${stock.percentage}%)',
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: PColors.success, fontWeightDelta: 2),
                        ),
                      ],
                    ),
                  ]),
            );
          },
          seperatorBuilder: (_, index) {
            return const SizedBox(
              width: PSizes.spaceBtwItems / 2,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: StockInfoList.stockInfo.length),
    );
  }
}
