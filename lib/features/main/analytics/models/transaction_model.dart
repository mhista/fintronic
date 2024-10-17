class TransactionModel {
  String title;
  String description;
  double price;
  DateTime date;
  String status;
  String transactionType;
  String? bigImage;
  String smallImage;
  String type;
  TransactionModel({
    required this.title,
    required this.description,
    required this.price,
    required this.date,
    required this.status,
    required this.transactionType,
    this.bigImage,
    required this.smallImage,
    required this.type,
  });
}
