import 'package:fintronic/utils/constants/image_strings.dart';

class NewsModel {
  final String title;
  final String description;
  final String image;
  final String time;
  NewsModel({
    required this.title,
    required this.description,
    required this.image,
    required this.time,
  });
}

class NewsList {
  static final List<NewsModel> newsList = [
    NewsModel(
      title: 'GDP/USD',
      description:
          'GBP/USD Price forecast: Climbs to three-day peak, approaches 1.3000',
      image: PImages.currency1,
      time: '30 minutes ago',
    ),
    NewsModel(
      title: 'REGULATION',
      description:
          'Denmark proposes taxing unrealized crypto gains as it does with some traditional financial contracts',
      image: PImages.reg1,
      time: '50 minutes ago',
    ),
    NewsModel(
      title: 'CRYPTO/CRIME',
      description:
          '\$30 million international crypto fraud from 2018 kicks off trial in France',
      image: PImages.crypt1,
      time: '1 hour ago',
    ),
    // Add more news items as needed...
  ];
}
