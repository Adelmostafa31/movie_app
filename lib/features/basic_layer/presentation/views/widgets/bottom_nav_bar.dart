import 'dart:ui';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/basic_layer/presentation/manager/basic_layer_cubit/basic_layer_cubit.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
class bottom_nav_bar extends StatelessWidget {
  const bottom_nav_bar({Key? key, required this.cubit}) : super(key: key);
  final basic_layer_cubit cubit ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  SizedBox(
      height: height * 0.09,
      width: width,
      child: Container(
        clipBehavior: Clip.antiAlias,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsets.only(
          left: width * 0.15,
          right: width * 0.15,
          bottom: height * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(height * 0.03),
        ),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.only(bottom: height * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(height * 0.02),
                  border: Border.all(color: Colors.white)),
              child: CustomNavigationBar(
                items: [
                  CustomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      size: height * 0.05,
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.grid,
                      size: height * 0.046,
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
                currentIndex: cubit.currentIndexBottomNav,
                onTap: (index) {
                  cubit.ChangeBottomNav(index);
                },
                strokeColor: Colors.orange,
                selectedColor: Colors.orange,
                unSelectedColor: Colors.black.withOpacity(0.8),
                iconSize: height * 0.035,
                borderRadius: Radius.circular(height * 0.05),
                elevation: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
