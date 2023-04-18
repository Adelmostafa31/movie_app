import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/styles/colors.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/basic_layer/presentation/manager/basic_layer_cubit/basic_layer_cubit.dart';
import 'package:movie_app/features/basic_layer/presentation/manager/basic_layer_cubit/basic_layer_state.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:movie_app/features/basic_layer/presentation/views/widgets/bottom_nav_bar.dart';

class basic_layer extends StatelessWidget {
  const basic_layer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<basic_layer_cubit, basic_layer_state>(
      builder: (BuildContext context, state) {
        var cubit = basic_layer_cubit.get(context);
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          transform: Matrix4.translationValues(cubit.x, cubit.y, 0)
            ..scale(cubit.isDrawer ? 0.85 : 1.00)
            ..rotateZ(cubit.isDrawer ? -50 : 0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: cubit.isDrawer
                  ? BorderRadius.circular(height * 0.04)
                  : BorderRadius.circular(0),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 200, color: Colors.black, offset: Offset(0, 10))
              ]),
          child: Stack(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  cubit.screens[cubit.currentIndexBottomNav],
                  bottom_nav_bar(
                    cubit: cubit,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.isDrawer
                            ? cubit.isDrawer = false
                            : cubit.isDrawer = true;
                        cubit.ChangeDrawer(cubit.isDrawer);
                      },
                      icon: cubit.isDrawer
                          ? Icon(
                              EvaIcons.close,
                              size: height * 0.055,
                              color: Colors.orange,
                            )
                          : Icon(
                              EvaIcons.options2,
                              size: height * 0.055,
                              color: Colors.orange,
                            ),
                    ),
                    SizedBox(
                      width: width * 0.15,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height*0.012),
                      child: Text(
                        'Explore Films',
                        style: TextStyle(
                            fontSize: height * 0.04,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
