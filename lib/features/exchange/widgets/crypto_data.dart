import 'package:fintronic/common/widgets/containers/dropdown_container.dart';
import 'package:fintronic/common/widgets/images/circular_images.dart';
import 'package:fintronic/features/analytics/dummy_data.dart/crypto_data_dummy.dart';
import 'package:fintronic/features/analytics/dummy_data.dart/leaderboard_dummy.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/texts/title_subtitle.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/formatters/formatter.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CryptoPriceData extends StatelessWidget {
  const CryptoPriceData({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        PSectionHeading(
          title: 'Crypto',
          onPressed: () {},
          showActionButton: false,
          useIcon: true,
        ),
        ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final cryptoData = CryptoDataDummy.cryptoDataModels.sublist(0, 3);
              final data = cryptoData[index];
              return TRoundedContainer(
                height: 70,
                width: 330,
                radius: 25,
                backgroundColor:
                    isDark ? PColors.dark.withOpacity(0.8) : PColors.light,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: PCircularImage(
                                // padding: 10,
                                imageUrl: data.image,
                                width: 50,
                                height: 50,

                                //     PColors.secondary.withOpacity(0.5),
                                // borderRadius: 100,
                              ),
                            ),
                          ],
                        ),
                        // TITLE AND DESCRIPTION
                        const SizedBox(
                          width: PSizes.sm,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: PSizes.spaceBtwItems),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name,
                                  style:
                                      Theme.of(context).textTheme.titleLarge!,
                                ),
                                const SizedBox(
                                  height: PSizes.spaceBtwItems / 3,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(' \$${data.currentPrice.toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .apply(fontWeightDelta: 1)),
                                    const SizedBox(
                                      width: PSizes.sm,
                                    ),
                                    // const Icon(
                                    //   EvaIcons.trendingUpOutline,
                                    //   color: PColors.success,
                                    //   size: 16,
                                    // ),
                                    // const SizedBox(
                                    //   width: PSizes.sm / 3,
                                    // ),
                                    Text(
                                      '${data.percentage}% ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .apply(
                                            color: PColors.error,
                                          ),
                                    ),
                                  ],
                                ),
                                // Text(date,
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodySmall!
                                //         .apply(
                                //           // fontSizeDelta: ,
                                //           overflow: TextOverflow.ellipsis,
                                //         )),
                              ],
                            ))
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: PSizes.spaceBtwItems,
                          right: PSizes.spaceBtwItems,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data.noOfCoins.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(fontSizeDelta: -2),
                            ),
                            // const SizedBox(
                            //   height: PSizes.spaceBtwItems / 3,
                            // ),

                            const SizedBox(
                              height: PSizes.xs,
                            ),
                            // const SizedBox(
                            //   height: PSizes.spaceBtwItems / 3,
                            // ),
                            Text('\$${data.amountInWallet}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(
                                      // fontSizeDelta: ,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                          ],
                        ))
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
            itemCount: 3)
      ],
    );
  }
}

// class LeaderboardImageType extends StatelessWidget {
//   const LeaderboardImageType({
//     super.key,
//     required this.data,
//   });

//   final LeaderboardModel data;

//   @override
//   Widget build(BuildContext context) {
//     return data.transactionType == TransactionType.bankTransfer.name
//         ? const Positioned(
//             top: 1,
//             left: 1,
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Icon(
//                 Icons.arrow_outward_outlined,
//                 size: 18,
//                 color: PColors.dark,
//               ),
//             ),
//           )
//         : data.transactionType == TransactionType.cryptoBuy.name
//             ? const Positioned(
//                 top: 1,
//                 left: 1,
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Icon(
//                     Icons.arrow_downward_outlined,
//                     size: 18,
//                     color: PColors.dark,
//                   ),
//                 ),
//               )
//             : data.transactionType == TransactionType.cryptoSell.name
//                 ? const Positioned(
//                     top: 1,
//                     left: 1,
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Icon(
//                         Icons.arrow_outward_outlined,
//                         size: 18,
//                         color: PColors.dark,
//                       ),
//                     ),
//                   )
//                 : const SizedBox.shrink();
//   }
// }
