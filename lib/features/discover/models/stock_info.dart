import 'package:fintronic/utils/constants/image_strings.dart';

class StockInfo {
  final String companyName;
  final double stockPrice;
  final double percentage;
  final bool isDown;
  final String image;
  StockInfo({
    required this.companyName,
    required this.stockPrice,
    required this.percentage,
    required this.isDown,
    required this.image,
  });
}

class StockInfoList {
  static final List<StockInfo> stockInfo = [
    StockInfo(
        companyName: 'Tesla Inc.',
        stockPrice: 150.75,
        percentage: 1.2,
        isDown: false,
        image: PImages.tesla),
    StockInfo(
      companyName: 'Apple Inc.',
      stockPrice: 122.75,
      percentage: 1.5,
      isDown: false,
      image: PImages.apple,
    ),
    StockInfo(
      companyName: 'Google Inc.',
      stockPrice: 100.5,
      percentage: 2.5,
      isDown: true,
      image: PImages.google,
    ),
    // StockInfo(
    //   companyName: 'Microsoft',
    //   stockPrice: 175.25,
    //   percentage: 0.8,
    //   isDown: false,
    //   image:'microsoft.png',
    // ),
  ];
}
