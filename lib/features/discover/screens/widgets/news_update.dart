import 'package:flutter/material.dart';

import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/crypto_news.dart';

class NewsUpdate extends StatelessWidget {
  const NewsUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListLayout(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final newsData = NewsList.newsList;
          final news = newsData[index];
          return TRoundedContainer(
            radius: 10,
            useContainerGradient: false,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PRoundedImage(
                  borderRadius: 7,
                  imageUrl: news.image,
                  imageWidth: 90,
                  imageHeight: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 210,
                      child: Text(
                        news.description,
                        // textAlign: TextAlign.justify,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontSizeDelta: -1, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: PSizes.sm,
                    ),
                    Row(
                      children: [
                        Text(news.title,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(fontSizeDelta: -1)),
                        const SizedBox(
                          width: PSizes.sm,
                        ),
                        Text(news.time,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(fontSizeDelta: -1, color: PColors.info)),
                      ],
                    ),
                  ],
                )
              ],
            ),
            // isThreeLine: true,
          );
        },
        seperatorBuilder: (_, index) => const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
        scrollDirection: Axis.vertical,
        itemCount: NewsList.newsList.length);
  }
}
