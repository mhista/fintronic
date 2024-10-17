enum TextSizes { small, medium, large }

enum OrderStatus { processing, shipped, delivered }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm,
  stripe,
  wise
}

enum TransactionStatus {
  pending,
  success,
  failed,
  processing,
  buy,
  sell,
}

enum Type {
  crypt,
  bank,
  forex,
}

enum TransactionType {
  cryptoSell,
  cryptoBuy,
  bankTransfer,
  bankReceive,
  forexSell,
  forexReceive,
  donation,
}

enum CryptoType {
  bitcoin,
  bnb,
  ethereum,
  ton,
  solana,
  tether,
}
