import 'package:fintronic/features/analytics/models/transaction_model.dart';
import 'package:fintronic/utils/constants/enums.dart';
import 'package:fintronic/utils/constants/image_strings.dart';

class TransactionDummyData {
  static final List<TransactionModel> transactions = [
    TransactionModel(
      type: Type.bank.name,
      title: 'Jerome Bell',
      description: 'Receive money',
      price: 4000,
      date: DateTime.now(),
      status: TransactionStatus.success.name,
      transactionType: TransactionType.bankReceive.name,
      smallImage: PImages.wise,
      bigImage: PImages.avatar,
    ),
    TransactionModel(
      type: Type.crypt.name,
      title: 'Bitcoin',
      description: 'Buy order #5564',
      price: 1000,
      date: DateTime.now(),
      status: TransactionStatus.buy.name,
      transactionType: TransactionType.cryptoBuy.name,
      smallImage: PImages.bitcoin,
      bigImage: PImages.bitcoin,
    ),
    TransactionModel(
      type: Type.bank.name,
      title: 'John stellion',
      description: 'Transfer',
      price: 400,
      date: DateTime.now(),
      status: TransactionStatus.pending.name,
      transactionType: TransactionType.bankTransfer.name,
      smallImage: PImages.paypal,
      bigImage: PImages.avatar,
    ),
    TransactionModel(
      type: Type.crypt.name,
      title: 'Ethereum',
      description: 'Sell order #5784',
      price: 50,
      date: DateTime.now(),
      status: TransactionStatus.sell.name,
      transactionType: TransactionType.cryptoSell.name,
      smallImage: PImages.ethereum,
      bigImage: PImages.ethereum,
    ),
    TransactionModel(
        type: Type.crypt.name,
        title: 'USDT',
        description: 'Buy order #6453',
        price: 20,
        date: DateTime.now(),
        status: TransactionStatus.buy.name,
        transactionType: TransactionType.cryptoBuy.name,
        smallImage: PImages.tether),
    TransactionModel(
      type: Type.bank.name,
      title: 'Innocent Diwe',
      description: 'Transfer',
      price: 1200,
      date: DateTime.now(),
      status: TransactionStatus.failed.name,
      transactionType: TransactionType.bankTransfer.name,
      smallImage: PImages.stripe,
      bigImage: PImages.avatar,
    ),
  ];
}
