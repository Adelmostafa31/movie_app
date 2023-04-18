import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:movie_app/core/styles/colors.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/login_register/presentation/views/register.dart';

class animated_text extends StatelessWidget {
  const animated_text({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final  onTap;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return AnimatedTextKit(
      repeatForever: true,
      stopPauseOnTap: true,
      animatedTexts: [
        FlickerAnimatedText(text,
            textStyle: style1(
              size: height * 0.03,
              color: defualtColor(),
            )),
        WavyAnimatedText(text,
            textStyle: style1(
              size: height * 0.03,
              color: defualtColor(),
            )),
      ],
      onTap: onTap,
      isRepeatingAnimation: true,
    );
  }
}
