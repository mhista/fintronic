import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fintronic/common/animations/slide_animations/slide_animation.dart';
import 'package:fintronic/common/widgets/appbar/appBar.dart';
import 'package:fintronic/common/widgets/containers/rounded_container.dart';
import 'package:fintronic/common/widgets/icons/circular_icon.dart';
import 'package:fintronic/common/widgets/images/circular_images.dart';
import 'package:fintronic/common/widgets/images/edge_rounded_images.dart';
import 'package:fintronic/common/widgets/texts/section_heading.dart';
import 'package:fintronic/features/analytics/dummy_data.dart/transaction_dummy_data.dart';
import 'package:fintronic/features/analytics/models/transaction_model.dart';
import 'package:fintronic/utils/constants/enums.dart';
import 'package:fintronic/utils/constants/image_strings.dart';
import 'package:fintronic/utils/constants/text_strings.dart';
import 'package:fintronic/utils/formatters/formatter.dart';
import 'package:fintronic/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/buttons/gradient_button.dart';
import '../../../common/widgets/containers/glass_container.dart';
import '../../../common/widgets/texts/title_subtitle.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'widgets/balance_widget.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_notification.dart';
import 'widgets/recent_activity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: HomeAppBar(
        backgroundColor: isDark ? PColors.black : PColors.white,
        containerBgColor: isDark ? PColors.black : PColors.white,
        usesGradient: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PSizes.sm * 2),
          child: Column(
            children: [
              // APP BAR
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // BALANCE CONTAINER
              SlideAnimation(child: BalanceWidget(isDark: isDark)),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // URGENT NOTIFICATION
              const SlideAnimation(child: UrgentNotification()),
              const SizedBox(
                height: PSizes.sm,
              ),
              // RECENT ACTIVITIES
              const RecentActivityWidget()
            ],
          ),
        ),
      ),
    );
  }
}
