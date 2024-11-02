import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/crypto_model.dart';

class CryptoController extends GetxController {
  static CryptoController get instance => Get.find();
  RxList<CryptoData> chartData = <CryptoData>[].obs;
  Timer? _timer;
  final selectedInterval = 7.obs; //

  // initialize
  @override
  onReady() {
    fetchInitialData();
    startAutoUpdate();
    printCryptoDatas();
  }

  void fetchInitialData() {
    chartData.value = getInitialCryptoData();
    chartData.refresh();
  }

  void printCryptoDatas() {
    for (var x in chartData) {
      debugPrint(x.toString());
    }
  }

  // Dummy random value generator for crypto price
  double getRandomCryptoValue() {
    final Random random = Random();
    return random.nextInt(50000) + 1;
  }

// dummy data generator for crypto price
  List<CryptoData> getInitialCryptoData() {
    return List.generate(20, (index) {
      return CryptoData(DateTime.now().subtract(Duration(days: index)),
          getRandomCryptoValue());
    });
  }

//  update the chart every 10 seconds
  void startAutoUpdate() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {});
    printCryptoDatas();
  }

// simulate fetching new data from an API for cryptocurrency
  void updateChartData() {
    chartData.add(CryptoData(DateTime.now(), getRandomCryptoValue()));

    // keep the last X days of datat based on the selected interval
    chartData.value = chartData
        .where(
          (data) => data.date.isAfter(
            DateTime.now().subtract(
              Duration(days: selectedInterval.value),
            ),
          ),
        )
        .toList();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
