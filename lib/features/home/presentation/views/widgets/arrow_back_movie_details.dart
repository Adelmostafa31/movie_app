import 'package:flutter/material.dart';

class arrow_back_movie_details extends StatelessWidget {
  const arrow_back_movie_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: EdgeInsets.only(left: width * 0.01, top: height * 0.02),
      child: CircleAvatar(
        radius: height*0.035,
        backgroundColor: Colors.orangeAccent.withOpacity(0.5),
        child: Padding(
          padding:  EdgeInsets.only(bottom: height*0.02,right: width*0.023),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: height * 0.045,
              color: Colors.orange.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}
