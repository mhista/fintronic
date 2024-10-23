class CryptoData {
  CryptoData(this.date, this.value);
  final DateTime date;
  final double value;

  @override
  String toString() => 'CryptoData(date: $date, value: $value)';
}
