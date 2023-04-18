import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

////////// Navigator //////////
Future<dynamic> navigator1(
    {required BuildContext context, required Widget widget}) =>
    Navigator.push(
        context,
        PageTransition(
          child: widget,
          type: PageTransitionType.bottomToTop,
        ));
Future<dynamic> navigator2(
    {required BuildContext context, required Widget widget}) =>
    Navigator.push(
        context,
        PageTransition(
          child: widget,
          type: PageTransitionType.leftToRight,
        ));

////////// text styel //////////
TextStyle style1 ({
  double size = 25,
  Color color = Colors.black
})=>
    TextStyle(
  fontFamily: 'Righteous',
  fontWeight: FontWeight.bold,
  fontSize: size,
);




////////// Text Form Field //////////

textField({
  required TextEditingController controller,
  required BuildContext context,
  required String hint,
  required TextInputType textInputType,
  Validate,
  secure = false,
  icon,
  double fontSize = 0,
  double hintfontSize = 0
}) =>
    TextFormField(
      controller: controller,
      validator: Validate,
      obscureText: secure,
      keyboardType: textInputType,
      style: TextStyle(
        fontSize: fontSize
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(MediaQuery.of(context).size.height * 0.025),
                bottomLeft: Radius.circular(MediaQuery.of(context).size.height * 0.025),
              )),
          hintText: hint,
          hintStyle: style1(
            size: hintfontSize,
          ),
        prefixIcon: icon
      ),
    );

////////// Ink Well Sign In &  Sign Up //////////
signInButton({required BuildContext context, required String text,onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.antiAlias,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.07,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight:
              Radius.circular(MediaQuery
                  .of(context)
                  .size
                  .height * 0.025),
              bottomLeft:
              Radius.circular(MediaQuery
                  .of(context)
                  .size
                  .height * 0.025),
            ),
            color: Colors.orangeAccent),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery
                .of(context)
                .size
                .height * 0.03,
          ),
        ),
      ),
    );

///////// facebook & google container ///////////
fgContainer({required BuildContext context,
  onTap,
  required IconData icon,
  double size = 20}) =>
    InkWell(
      onTap:onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.123,
        width: MediaQuery
            .of(context)
            .size
            .height * 0.123,
        decoration: BoxDecoration(
          color: Colors.orangeAccent.withOpacity(0.4),
          borderRadius: BorderRadius.only(
            topRight:
            Radius.circular(MediaQuery
                .of(context)
                .size
                .height * 0.025),
            bottomLeft:
            Radius.circular(MediaQuery
                .of(context)
                .size
                .height * 0.025),
          ),
        ),
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );

