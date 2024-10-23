import 'dart:convert';

class CryptoDataModel {
  final String image;
  final String name;
  final double currentPrice;
  final double amountInWallet;
  final double percentage;
  final double noOfCoins;
  CryptoDataModel({
    required this.image,
    required this.name,
    required this.currentPrice,
    required this.amountInWallet,
    required this.percentage,
    required this.noOfCoins,
  });

  static CryptoDataModel empty() => CryptoDataModel(
      image: '',
      name: '',
      currentPrice: 0,
      amountInWallet: 0,
      percentage: 0,
      noOfCoins: 0);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'image': image});
    result.addAll({'name': name});
    result.addAll({'currentPrice': currentPrice});
    result.addAll({'amountInWallet': amountInWallet});
    result.addAll({'percentage': percentage});
    result.addAll({'noOfCoins': noOfCoins});

    return result;
  }

  factory CryptoDataModel.fromMap(Map<String, dynamic> map) {
    return CryptoDataModel(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      currentPrice: map['currentPrice']?.toDouble() ?? 0.0,
      amountInWallet: map['amountInWallet']?.toDouble() ?? 0.0,
      percentage: map['percentage']?.toDouble() ?? 0.0,
      noOfCoins: map['noOfCoins']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDataModel.fromJson(String source) =>
      CryptoDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CryptoDataModel(image: $image, name: $name, currentPrice: $currentPrice, amountInWallet: $amountInWallet, percentage: $percentage, noOfCoins: $noOfCoins)';
  }
}
