import 'package:flutter/material.dart';
import 'package:movie_app/core/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class smooth_indecator extends StatelessWidget {
  const smooth_indecator({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: pageController,
        count: 4,
        effect: ExpandingDotsEffect(
            dotColor: Colors.grey.withOpacity(0.5),
            activeDotColor: defualtColor(),
            dotHeight: 10,
            dotWidth: 20,
            expansionFactor: 2,
            radius: 20,
            spacing: 10));
  }
}
