class LeaderboardModel {
  String title;
  String description;
  double price;
  DateTime date;
  String transactionType;
  String? bigImage;
  String type;
  LeaderboardModel({
    required this.title,
    required this.description,
    required this.price,
    required this.date,
    required this.transactionType,
    this.bigImage,
    required this.type,
  });
}
