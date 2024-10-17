import 'package:fintronic/features/main/analytics/models/transaction_model.dart';
import 'package:fintronic/utils/constants/enums.dart';
import 'package:fintronic/utils/constants/image_strings.dart';

import '../models/leaderboard_model.dart';

class LeaderboardDummyData {
  static final List<LeaderboardModel> transactions = [
    LeaderboardModel(
      type: Type.crypt.name,
      title: 'Crypto sell',
      description: 'Buy order #5564',
      price: 1000,
      date: DateTime.now(),
      transactionType: TransactionType.cryptoSell.name,
      bigImage: PImages.crypto,
    ),
    LeaderboardModel(
      type: Type.bank.name,
      title: 'Transfer to bank',
      description: 'Receive money',
      price: 20000,
      date: DateTime.now(),
      transactionType: TransactionType.bankTransfer.name,
      bigImage: PImages.transact,
    ),
    LeaderboardModel(
      type: Type.bank.name,
      title: 'Money received',
      description: 'Transfer',
      price: 4000,
      date: DateTime.now(),
      transactionType: TransactionType.cryptoBuy.name,
      bigImage: PImages.transact,
    ),
    LeaderboardModel(
      type: Type.crypt.name,
      title: 'Crypto bought',
      description: 'Sell order #5784',
      price: 5000,
      date: DateTime.now(),
      transactionType: TransactionType.cryptoBuy.name,
      bigImage: PImages.crypto,
    ),
    LeaderboardModel(
      type: Type.crypt.name,
      title: 'USDT',
      description: 'Buy order #6453',
      price: 20,
      date: DateTime.now(),
      transactionType: TransactionType.cryptoBuy.name,
    ),
    LeaderboardModel(
      type: Type.bank.name,
      title: 'Innocent Diwe',
      description: 'Transfer',
      price: 1200,
      date: DateTime.now(),
      transactionType: TransactionType.bankTransfer.name,
      bigImage: PImages.avatar,
    ),
  ];
}
