import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/features/analytics/models/vertical_bar_chart.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../controllers/crypto_controller.dart';
import '../models/crypto_model.dart';
// import '../../dummy_data.dart/analytics_dummy.dart';

class CryptoChartWidget extends StatelessWidget {
  const CryptoChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['7d', '30d', '90d'];
    final spenditure = [
      'BUY',
      'SELL',
    ];

    final isDark = PHelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      useContainerGradient: false,
      backgroundColor: isDark ? PColors.black : PColors.white,
      width: 300,
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TRoundedContainer(
                  width: 110,
                  // padding: EdgeInsets.all(0),
                  useContainerGradient: false,
                  backgroundColor: isDark ? PColors.black : PColors.white,
                  height: 30,
                  radius: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Total Assets',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Iconsax.eye,
                          size: 16,
                        ),
                      )
                    ],
                  )),
              TRoundedContainer(
                width: 90,
                // padding: EdgeInsets.all(0),
                useContainerGradient: false,
                backgroundColor: isDark ? PColors.dark : PColors.light,
                height: 28,
                radius: 16,
                child: Center(
                    child: CustomDropdown(
                  // expandedHeaderPadding: EdgeInsets.all(0),

                  closedHeaderPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: CustomDropdownDecoration(
                    expandedFillColor: isDark ? PColors.black : PColors.white,
                    closedFillColor: isDark ? PColors.dark : PColors.light,
                    // closedBorderRadius: BorderRadius.circular(16),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeDelta: -1),
                    listItemStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeDelta: -1),
                    headerStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeDelta: -1),
                  ),
                  items: items,
                  hintText: items[0],
                  initialItem: items[0],
                  onChanged: (value) {},
                )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 6, bottom: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\$145,785.4',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(fontSizeDelta: 10),
                ),
                const SizedBox(
                  width: PSizes.sm,
                ),
                const Icon(
                  EvaIcons.trendingUpOutline,
                  color: PColors.success,
                  size: 16,
                ),
                const SizedBox(
                  width: PSizes.sm / 3,
                ),
                Text(
                  '+8.50% ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: PColors.success, fontWeightDelta: 2),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TRoundedContainer(
                  width: 130,
                  // padding: EdgeInsets.all(0),
                  padding: const EdgeInsets.only(left: 8),
                  useContainerGradient: false,
                  backgroundColor: isDark ? PColors.black : PColors.white,
                  radius: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '≈ 0.000045 BTC',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Iconsax.info_circle,
                          size: 14,
                        ),
                      )
                    ],
                  )),
            ],
          ),
          const CryptoChart(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TRoundedContainer(
                  // width: 110,
                  // padding: EdgeInsets.all(0),
                  padding: const EdgeInsets.only(left: 8),
                  useContainerGradient: false,
                  backgroundColor: isDark ? PColors.black : PColors.white,
                  radius: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Last Updated: 2024-10-13 03:58 (UTC)',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                            color: isDark
                                ? PColors.light.withOpacity(0.5)
                                : PColors.dark.withOpacity(0.5)),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class CryptoChart extends StatelessWidget {
  const CryptoChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    final controller = CryptoController.instance;

    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
          tooltipBehavior: TooltipBehavior(
            enable: true,
            shouldAlwaysShow: true,
            // activationMode: ActivationMode.doubleTap
            // builder: (data, point, series, pointIndex, seriesIndex) {},
          ),
          // zoomPanBehavior: ZoomPanBehavior(
          //   enablePinching: true,
          //   enableMouseWheelZooming: true,
          //   enablePanning: true,
          //   enableSelectionZooming: true,
          // ),
          // legend: Legend(isVisible: true),dfjkl;zxcbn,.
          plotAreaBackgroundColor: PColors.transparent,
          plotAreaBorderWidth: 0,
          // enableSideBySideSeriesPlacement: false,
          margin: const EdgeInsets.all(0),
          primaryXAxis: DateTimeAxis(
            isVisible: false,
            labelStyle:
                Theme.of(context).textTheme.bodySmall!.apply(fontSizeDelta: -1),
            dateFormat: DateFormat.MMMd(),
            intervalType: DateTimeIntervalType.days,
            // minimum: DateTime(24),
            interval: 7,
            majorTickLines:
                const MajorTickLines(width: 0, color: PColors.transparent),
            minorTickLines: const MinorTickLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0),
            majorGridLines: const MajorGridLines(width: 1),
            axisLine: const AxisLine(
              width: 0.1,
            ),
          ),
          primaryYAxis: NumericAxis(
            // title: AxisTitle(text: 'USD'),
            labelPosition: ChartDataLabelPosition.outside,
            isVisible: false,
            minimum: 100,
            maximum: 50000,
            interval: 100,
            numberFormat: NumberFormat.currency(symbol: '\$'),
            // majorGridLines: const MajorGridLines(width: 0.5),
            // majorTickLines:
            //     const MajorTickLines(width: 0.5, color: PColors.dark),
            // minorTickLines:
            //     const MinorTickLines(width: 0.5, color: PColors.dark),
            // minorGridLines: const MinorGridLines(width: 0.5),
            // interactiveTooltip: ,
          ),
          series: [
            LineSeries<CryptoData, DateTime>(
              dataSource: controller.chartData,
              xValueMapper: (CryptoData sales, _) => sales.date,
              yValueMapper: (CryptoData sales, _) => sales.value,
              width: isDark ? 2 : 2,
              color: isDark ? PColors.primary : PColors.primary,
              // markerSettings: MarkerSettings(isVisible: true),
              dataLabelSettings: const DataLabelSettings(
                // isVisible: true,
                alignment: ChartAlignment.near,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
