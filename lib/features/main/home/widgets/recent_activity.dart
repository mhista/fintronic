import 'package:fintronic/common/animations/slide_animations/list_slide_animation.dart';
import 'package:fintronic/common/animations/slide_animations/slide_animation.dart';
import 'package:fintronic/common/widgets/layouts/list_layout.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/texts/title_subtitle.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/formatters/formatter.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../analytics/dummy_data.dart/transaction_dummy_data.dart';
import '../../../analytics/models/transaction_model.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Column(children: [
      SlideAnimation(
        child: PSectionHeading(
          title: 'Recent Activity',
          onPressed: () {},
        ),
      ),
      ListLayout(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final transactions = TransactionDummyData.transactions.sublist(0, 2);
          final data = transactions[index];
          final date = PFormatter.formatDate(data.date);
          return ListSlideAnimation(
            index: index,
            itemCount: transactions.length,
            child: TRoundedContainer(
              height: 70,
              width: 330,
              radius: 25,
              backgroundColor: isDark ? PColors.dark : PColors.light,
              useContainerGradient: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // IMAGES STACK
                      Stack(
                        children: [
                          PRoundedImage(
                            imageUrl: data.bigImage!,
                            width: 50,
                            borderRadius: 100,
                          ),
                          Positioned(
                            bottom: 2,
                            right: 5,
                            child: Stack(
                              children: [
                                const TRoundedContainer(
                                  radius: 100,
                                  height: 20,
                                  width: 20,
                                  backgroundColor: PColors.white,
                                  useContainerGradient: false,
                                ),
                                TransactionImageType(data: data),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // TITLE AND DESCRIPTION
                      const SizedBox(
                        width: PSizes.sm,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: PSizes.spaceBtwItems),
                        child: TransactionTitleSubtitle(
                            isStatus: false,
                            title: data.title,
                            subTitle: data.description,
                            status: data.status,
                            transactionType: data.transactionType,
                            type: data.type),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PSizes.spaceBtwItems,
                      right: PSizes.spaceBtwItems,
                    ),
                    child: TransactionTitleSubtitle(
                        title: '\$${data.price.toString()}',
                        subTitle: date,
                        status: data.status,
                        transactionType: data.transactionType,
                        type: data.type),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: TransactionDummyData.transactions.sublist(0, 2).length,
        scrollDirection: Axis.vertical,
        seperatorBuilder: (context, index) => const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
      )
    ]);
  }
}

class TransactionImageType extends StatelessWidget {
  const TransactionImageType({
    super.key,
    required this.data,
  });

  final TransactionModel data;

  @override
  Widget build(BuildContext context) {
    return data.transactionType == TransactionType.bankTransfer.name
        ? const Positioned(
            top: 1,
            left: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_outward_outlined,
                size: 18,
                color: PColors.dark,
              ),
            ),
          )
        : data.transactionType == TransactionType.cryptoBuy.name
            ? const Positioned(
                top: 1,
                left: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_downward_outlined,
                    size: 18,
                    color: PColors.dark,
                  ),
                ),
              )
            : data.transactionType == TransactionType.cryptoSell.name
                ? const Positioned(
                    top: 1,
                    left: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_outward_outlined,
                        size: 18,
                        color: PColors.dark,
                      ),
                    ),
                  )
                : Positioned(
                    top: 1,
                    right: -7,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: PRoundedImage(
                        imageUrl: data.smallImage,
                        width: 18,
                        borderRadius: 100,
                      ),
                    ),
                  );
  }
}
