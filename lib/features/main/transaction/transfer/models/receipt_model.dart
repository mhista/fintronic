class TransactionReceipt {
  final String transactionNumber;
  final DateTime date;
  final String recipient;
  final double payment;
  final double charge;
  final double total;
  TransactionReceipt({
    required this.transactionNumber,
    required this.date,
    required this.recipient,
    required this.payment,
    required this.charge,
    required this.total,
  });
}

final TransactionReceipt transactionReceipt = TransactionReceipt(
    transactionNumber: '#458794922',
    date: DateTime.now(),
    recipient: 'Jane Deo',
    payment: 120,
    charge: 1,
    total: 121);
