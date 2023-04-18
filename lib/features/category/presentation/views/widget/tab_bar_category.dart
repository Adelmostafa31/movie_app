import 'package:flutter/material.dart';
import 'package:movie_app/core/styles/colors.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class tab_bar_category extends StatelessWidget {
  const tab_bar_category({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TabBar(
      isScrollable: true,
      tabs: [
        Tab(
          text: 'Action'.toUpperCase(),
        ),
        Tab(
          text: 'Horror'.toUpperCase(),
        ),
        Tab(
          text: 'Adventure'.toUpperCase(),
        ),
        Tab(
          text: 'Cartoon'.toUpperCase(),
        ),
      ],
      labelColor: defualtColor(),
      labelStyle: TextStyle(fontSize: height*0.03,fontFamily: 'Righteous'),
      indicator: RectangularIndicator(
          color: Colors.orange.withOpacity(0.4),
          bottomLeftRadius: height*0.02,
          bottomRightRadius: height*0.02,
          topLeftRadius: height*0.02,
          topRightRadius: height*0.02,
          strokeWidth: 15),
      padding: EdgeInsets.only(left: width*0.02,right: width*0.02,bottom: height*0.02),
    );
  }
}
