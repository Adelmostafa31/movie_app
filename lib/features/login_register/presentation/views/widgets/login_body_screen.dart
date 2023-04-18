import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/styles/colors.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/basic_layer/presentation/views/basic_layer.dart';
import 'package:movie_app/features/drawer/presentation/views/drawer.dart';
import 'package:movie_app/features/home/presentation/views/home.dart';
import 'package:movie_app/features/login_register/presentation/manager/login_register_cubit/login_register_cubit.dart';
import 'package:movie_app/features/login_register/presentation/manager/login_register_cubit/login_register_state.dart';
import 'package:movie_app/features/login_register/presentation/views/register.dart';
import 'package:movie_app/features/login_register/presentation/views/widgets/animated_text.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class login_body_screen extends StatelessWidget {
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<login_register_cubit,login_register_state>(
      listener: (context, state) {
        if (state is get_user_success_state) {
          showToast(
            'Sign In With Google Success',
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
        } else if (state is login_success_state) {
          showToast(
            'Login Success',
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
        } else if (state is sign_in_with_google_error_state) {
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
        } else if (state is login_error_state) {
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
        }
      },
      builder: (context, state) {
        var cubit = login_register_cubit.get(context);
        return Scaffold(
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
                  Lottie.asset(
                    'assets/images/lock.json',
                    height: height * 0.38,
                    width: height * 0.38,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  textField(
                    textInputType: TextInputType.emailAddress,
                    controller: email_controller,
                    fontSize: height * 0.03,
                    hintfontSize: height * 0.03,
                    icon: Icon(
                      Icons.email_rounded,
                      size: height * 0.03,
                    ),
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
                  ),
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
                    fontSize: height * 0.03,
                    hintfontSize: height * 0.03,
                    icon: Icon(
                      Icons.lock,
                      size: height * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.023,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: Row(
                      children: [
                        Text('Don\'t have email...?',
                            style: style1(
                              size: height * 0.023,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: animated_text(
                              text: 'Register',
                              onTap: () {
                                navigator1(
                                    context: context, widget: const register());
                              },
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: state is! login_loading_state
                        ? signInButton(
                            context: context,
                            text: 'Sign In',
                            onTap: () {
                              if (form_key.currentState!.validate()) {
                                cubit.userLogin(
                                  email: email_controller.text,
                                  password: password_controller.text,
                                );
                              }
                            },
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text('OR',
                      style: style1(
                        size: height * 0.02,
                      )),
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
        ));
      },
    );
  }
}
