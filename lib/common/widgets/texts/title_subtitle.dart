import 'package:fintronic/common/widgets/containers/rounded_container.dart';
import 'package:fintronic/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:fintronic/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class TransactionTitleSubtitle extends StatelessWidget {
  const TransactionTitleSubtitle({
    super.key,
    this.recent = false,
    required this.title,
    required this.subTitle,
    this.useThemeColor = false,
    this.themeColor,
    required this.status,
    required this.transactionType,
    required this.type,
    this.isStatus = true,
  });
  final String title, subTitle;
  final String status;
  final String transactionType;
  final String type;
  final bool recent, useThemeColor, isStatus;
  final Color? themeColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            isStatus
                ? (transactionType == TransactionType.bankReceive.name ||
                        transactionType == TransactionType.bankTransfer.name)
                    ? status == TransactionStatus.failed.name
                        ? '-$title'
                        : '+$title'
                    : transactionType == TransactionType.cryptoBuy.name
                        ? '-$title'
                        : '+$title'
                : title,
            style: Theme.of(context).textTheme.titleLarge!.apply(
                  overflow: TextOverflow.ellipsis,
                  color: isStatus
                      ? (transactionType == TransactionType.bankReceive.name ||
                              transactionType ==
                                  TransactionType.bankTransfer.name)
                          ? status == TransactionStatus.failed.name
                              ? PColors.error
                              : status == TransactionStatus.pending.name
                                  ? PColors.warning
                                  : PColors.success
                          : transactionType == TransactionType.cryptoBuy.name
                              ? PColors.error
                              : PColors.success
                      : null,
                )),
        const SizedBox(
          height: PSizes.spaceBtwItems / 3,
        ),
        // if (type == Type.bank.name)
        //   TRoundedContainer(
        //     padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 5),
        //     useContainerGradient: false,
        //     backgroundColor: isStatus
        //         ? (transactionType == TransactionType.bankReceive.name ||
        //                 transactionType == TransactionType.bankTransfer.name)
        //             ? status == TransactionStatus.failed.name
        //                 ? PColors.error.withOpacity(0.2)
        //                 : status == TransactionStatus.pending.name
        //                     ? PColors.info.withOpacity(0.2)
        //                     : PColors.success.withOpacity(0.2)
        //             : Colors.transparent
        //         : Colors.transparent,
        //     child: Text(subTitle,
        //         style: Theme.of(context).textTheme.labelMedium!.apply(
        //             fontSizeDelta: 1,
        //             overflow: TextOverflow.ellipsis,
        //             color: null)),
        //   ),
        // if (type == Type.crypt.name || type == Type.forex.name)
        Text(subTitle,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                // fontSizeDelta: ,
                overflow: TextOverflow.ellipsis,
                color: useThemeColor ? themeColor : null)),
      ],
    );
  }
}
