import 'package:get/get.dart';

class AccountController extends GetxController {
  static AccountController get instance => Get.find();

  final hideBalance = false.obs;
}
