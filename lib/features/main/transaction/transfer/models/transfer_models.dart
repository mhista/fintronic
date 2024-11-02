import '../../../../../utils/constants/image_strings.dart';

class TransferMade {
  final String profilePics;
  final String accountNumber;
  final String accountName;
  final bool isRecent;
  final bool isFavorite;
  final bool isSelected;

  TransferMade({
    required this.profilePics,
    required this.accountNumber,
    required this.accountName,
    required this.isRecent,
    required this.isFavorite,
    required this.isSelected,
  });
}

class TransferList {
  static final List<TransferMade> transfer = [
    TransferMade(
      profilePics: PImages.profile6,
      accountNumber: "0009456735",
      accountName: "Alice Johnson",
      isRecent: false,
      isFavorite: true,
      isSelected: true,
    ),
    TransferMade(
      profilePics: PImages.profile1,
      accountNumber: "0001064882",
      accountName: "Bob Smith",
      isRecent: true,
      isFavorite: false,
      isSelected: false,
    ),
    TransferMade(
      profilePics: PImages.profile2,
      accountNumber: "0007947032",
      accountName: "Charlie Davis",
      isRecent: true,
      isSelected: false,
      isFavorite: false,
    ),
    TransferMade(
      profilePics: PImages.profile10,
      accountNumber: "0003672933",
      accountName: "Diana Prince",
      isRecent: false,
      isSelected: false,
      isFavorite: true,
    ),
    TransferMade(
      profilePics: PImages.profile7,
      accountNumber: "0002313032",
      accountName: "Edward King",
      isRecent: false,
      isSelected: false,
      isFavorite: true,
    ),
    TransferMade(
      profilePics: PImages.profile9,
      accountNumber: "0005123205",
      accountName: "Fiona White",
      isRecent: false,
      isSelected: false,
      isFavorite: false,
    ),
    TransferMade(
      profilePics: PImages.profile4,
      accountNumber: "0007036882",
      accountName: "George Young",
      isRecent: false,
      isSelected: false,
      isFavorite: false,
    ),
    TransferMade(
      profilePics: PImages.profile5,
      accountNumber: "0008460867",
      accountName: "Helen Brown",
      isRecent: false,
      isSelected: false,
      isFavorite: true,
    ),
    TransferMade(
      profilePics: PImages.profile8,
      accountNumber: "0006363201",
      accountName: "Isaac Newton",
      isRecent: false,
      isSelected: false,
      isFavorite: true,
    ),
  ];
}
