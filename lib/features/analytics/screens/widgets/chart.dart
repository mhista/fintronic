import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/features/analytics/models/vertical_bar_chart.dart';
import 'package:fintronic/utils/constants/sizes.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../dummy_data.dart/analytics_dummy.dart';

class ChartColumnWidget extends StatelessWidget {
  const ChartColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['weekly', 'monthly'];
    final spenditure = ['Expense', 'Income'];

    final isDark = PHelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      useContainerGradient: false,
      backgroundColor: isDark ? PColors.black : PColors.white,
      width: 300,
      height: 280,
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
                // backgroundColor: isDark ? PColors.dark : PColors.light,
                height: 30,
                radius: 16,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomDropdown(
                    // expandedHeaderPadding: EdgeInsets.all(0),
                    closedHeaderPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 19),
                    decoration: CustomDropdownDecoration(
                      closedFillColor: isDark ? PColors.black : PColors.white,
                      // closedBorderRadius: BorderRadius.circular(16),
                      expandedFillColor: isDark ? PColors.black : PColors.white,
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      listItemStyle: Theme.of(context).textTheme.labelSmall,
                      headerStyle: Theme.of(context).textTheme.labelSmall,
                    ),
                    items: spenditure,
                    hintText: spenditure[0],
                    initialItem: spenditure[0],
                    onChanged: (value) {},
                  ),
                ),
              ),
              TRoundedContainer(
                width: 110,
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
            padding: const EdgeInsets.only(top: 8, left: 15, bottom: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\$182,155',
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
                  '+12.50% ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: PColors.success, fontWeightDelta: 2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SfCartesianChart(
                // zoomPanBehavior: ZoomPanBehavior(enablePinching: true),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  shouldAlwaysShow: true,
                  // builder: (data, point, series, pointIndex, seriesIndex) {},
                ),
                plotAreaBackgroundColor: PColors.transparent,
                margin: const EdgeInsets.all(0),
                borderColor: PColors.transparent,
                borderWidth: 0,
                plotAreaBorderWidth: 0,
                enableSideBySideSeriesPlacement: false,
                primaryXAxis: CategoryAxis(
                    labelPosition: ChartDataLabelPosition.inside,
                    axisLine: const AxisLine(width: 0),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeDelta: -1),
                    majorGridLines: const MajorGridLines(width: 0),
                    majorTickLines: const MajorTickLines(width: 0),
                    crossesAt: 0),
                primaryYAxis: const NumericAxis(
                  labelPosition: ChartDataLabelPosition.inside,
                  isVisible: false,
                  minimum: 0,
                  maximum: 1,
                  interval: 0.5,
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(width: 0),
                  // interactiveTooltip: ,
                ),
                series: [
                  ColumnSeries<ChartColumnData, String>(
                      xValueMapper: (data, _) => data.x,
                      yValueMapper: (data, _) => data.y,
                      width: 0.5,
                      color: isDark ? PColors.darkGrey : PColors.softGrey,
                      enableTooltip: false,
                      borderRadius: BorderRadius.circular(20),
                      dataSource: ColumnChartData.columnChartData),
                  ColumnSeries<ChartColumnData, String>(
                      xValueMapper: (data, _) => data.x,
                      yValueMapper: (data, _) => data.y1,
                      // yAxisName: 'Income',
                      width: 0.5,
                      color: isDark ? PColors.primary : PColors.primary,
                      borderRadius: BorderRadius.circular(20),
                      dataSource: ColumnChartData.columnChartData)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
