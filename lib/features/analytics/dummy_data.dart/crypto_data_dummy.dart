import 'package:fintronic/features/analytics/models/crypto_data_model.dart';
import 'package:fintronic/utils/constants/image_strings.dart';

class CryptoDataDummy {
  static final List<CryptoDataModel> cryptoDataModels = [
    CryptoDataModel(
        image: PImages.toncoin,
        name: 'Toncoin',
        currentPrice: 5.15,
        amountInWallet: 62.4,
        percentage: -1.35,
        noOfCoins: 12),
    CryptoDataModel(
        image: PImages.bitcoin,
        name: 'Bitcoin',
        currentPrice: 66429,
        amountInWallet: 132858,
        percentage: -0.76,
        noOfCoins: 2),
    CryptoDataModel(
        image: PImages.ethereum,
        name: 'Ethereum',
        currentPrice: 2572.73,
        amountInWallet: 12865,
        percentage: -1.89,
        noOfCoins: 5)
  ];
}
