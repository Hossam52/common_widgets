import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget(
      {Key? key,
      required this.pageController,
      required this.count,
      this.activeColor,
      this.dotColor = Colors.black})
      : super(key: key);
  final PageController pageController;
  final Color? activeColor;
  final Color dotColor;
  final int count;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      effect: WormEffect(
          activeDotColor:
              activeColor ?? Theme.of(context).colorScheme.secondary,
          dotColor: dotColor,
          dotHeight: 12.h,
          dotWidth: 12.h),
      controller: pageController,
      count: count,
    );
  }
}
