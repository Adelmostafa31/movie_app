// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/styles/colors.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/drawer/presentation/views/drawer.dart';
import 'package:movie_app/features/home/presentation/views/home.dart';
import 'package:movie_app/features/login_register/presentation/manager/login_register_cubit/login_register_cubit.dart';
import 'package:movie_app/features/login_register/presentation/manager/login_register_cubit/login_register_state.dart';

class register_body_screen extends StatelessWidget {
  var email_controller = TextEditingController();
  var name_controller = TextEditingController();
  var password_controller = TextEditingController();
  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return BlocConsumer<login_register_cubit, login_register_state>(
        listener: (context, state) {
          if (state is get_user_success_state) {
            showToast(
              'Register Success',
              context: context,
              animation: StyledToastAnimation.slideFromLeftFade,
              reverseAnimation: StyledToastAnimation.fade,
              position: StyledToastPosition.center,
              animDuration: const Duration(seconds: 1),
              duration: const Duration(seconds: 4),
              backgroundColor: Colors.green,
              borderRadius: BorderRadius.circular(height * 0.02),
              textStyle: TextStyle(
                fontSize: height * 0.022,
                color: Colors.white,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastLinearToSlowEaseIn,
            ) ;
            navigator1(context: context, widget: const drawer());
          }
          if (state is register_error_state) {
            showToast(
              state.error,
              context: context,
              animation: StyledToastAnimation.slideFromLeftFade,
              reverseAnimation: StyledToastAnimation.fade,
              position: StyledToastPosition.center,
              animDuration: const Duration(seconds: 1),
              duration: const Duration(seconds: 4),
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(height * 0.02),
              textStyle: TextStyle(
                fontSize: height * 0.022,
                color: Colors.white,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastLinearToSlowEaseIn,
            ) ;
            navigator1(context: context, widget: const drawer());
          }
        }, builder: (context, state) {
      var cubit = login_register_cubit.get(context);
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: width * 0.01, top: height * 0.01),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: height * 0.05,
                color: Colors.orange.withOpacity(0.7),
              ),
            ),
          ),
          toolbarHeight: height * 0.07,
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: width * 0.02,
              right: width * 0.02,
              top: height * 0.1,
              bottom: height * 0.02),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: form_key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Lottie.asset(
                        'assets/images/user.json',
                        height: height * 0.38,
                        width: height * 0.38,
                        fit: BoxFit.cover,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          size: height * 0.05,
                          color: defualtColor(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  textField(
                      textInputType: TextInputType.text,
                      controller: name_controller,
                      context: context,
                      hint: 'Name',
                      Validate: (String? value) {
                        if (value!.isEmpty) {
                          return showToast(
                            'Please Fill All Fields',
                            context: context,
                            animation: StyledToastAnimation.slideFromLeftFade,
                            reverseAnimation: StyledToastAnimation.fade,
                            position: StyledToastPosition.center,
                            animDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 4),
                            backgroundColor: Colors.red,
                            borderRadius: BorderRadius.circular(height * 0.02),
                            textStyle: TextStyle(
                              fontSize: height * 0.022,
                              color: Colors.white,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                            reverseCurve: Curves.fastLinearToSlowEaseIn,
                          ) as String;
                        }
                        return null;
                      },
                      icon: Icon(
                        Icons.person,
                        size: height * 0.03,
                      ),
                      fontSize: height * 0.03,
                      hintfontSize: height * 0.03),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  textField(
                      textInputType: TextInputType.emailAddress,
                      controller: email_controller,
                      context: context,
                      hint: 'Email',
                      Validate: (String? value) {
                        if (value!.isEmpty) {
                          return showToast(
                            'Please Fill All Fields',
                            context: context,
                            animation: StyledToastAnimation.slideFromLeftFade,
                            reverseAnimation: StyledToastAnimation.fade,
                            position: StyledToastPosition.center,
                            animDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 4),
                            backgroundColor: Colors.red,
                            borderRadius: BorderRadius.circular(height * 0.02),
                            textStyle: TextStyle(
                              fontSize: height * 0.022,
                              color: Colors.white,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                            reverseCurve: Curves.fastLinearToSlowEaseIn,
                          ) as String;
                        }
                        return null;
                      },
                      icon: Icon(
                        Icons.email_rounded,
                        size: height * 0.03,
                      ),
                      fontSize: height * 0.03,
                      hintfontSize: height * 0.03),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  textField(
                      textInputType: TextInputType.visiblePassword,
                      controller: password_controller,
                      context: context,
                      secure: true,
                      hint: 'Password',
                      Validate: (String? value) {
                        if (value!.isEmpty) {
                          return showToast(
                            'Please Fill All Fields',
                            context: context,
                            animation: StyledToastAnimation.slideFromLeftFade,
                            reverseAnimation: StyledToastAnimation.fade,
                            position: StyledToastPosition.center,
                            animDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 4),
                            backgroundColor: Colors.red,
                            borderRadius: BorderRadius.circular(height * 0.02),
                            textStyle: TextStyle(
                              fontSize: height * 0.022,
                              color: Colors.white,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                            reverseCurve: Curves.fastLinearToSlowEaseIn,
                          ) as String;
                        }
                        return null;
                      },
                      icon: Icon(
                        Icons.lock,
                        size: height * 0.03,
                      ),
                      fontSize: height * 0.03,
                      hintfontSize: height * 0.03),
                  SizedBox(
                    height: height * 0.023,
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: signInButton(
                      context: context,
                      text: 'Sign Up',
                      onTap: () {
                        if (form_key.currentState!.validate()) {
                          cubit.userRegister(
                            name: name_controller.text,
                            email: email_controller.text,
                            password: password_controller.text,);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.065),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        fgContainer(
                            context: context,
                            icon: Icons.facebook,
                            size: height * 0.08,
                            onTap: () {}
                        ),
                        fgContainer(
                          context: context,
                          icon: EvaIcons.google,
                          size: height * 0.085,
                          onTap: () {
                            if (state is! sign_in_with_google_loading_state) {
                              cubit.signInWithGoogle();
                            } else {
                              const Center(child: CircularProgressIndicator());
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
