import 'package:fintronic/features/exchange/controllers/crypto_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CryptoController());
  }
}
