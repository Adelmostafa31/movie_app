import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/network/Cach_Helper/cach_helper.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/drawer/presentation/views/drawer.dart';
import 'package:movie_app/features/login_register/presentation/views/login.dart';

class splash_screen_body extends StatefulWidget {
  const splash_screen_body({Key? key}) : super(key: key);

  @override
  State<splash_screen_body> createState() => _splash_screen_bodyState();
}

class _splash_screen_bodyState extends State<splash_screen_body> {
  @override
  void initState() {
    var uid = CachHelper.getData(key: 'uid');
    Widget? widget;
    if (uid != null) {
        widget = drawer();
      } else {
        widget = login();
      }
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => navigator1(context: context, widget: widget!));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/images/splash_wight.json',
        ),
      ),
    );
  }
}
