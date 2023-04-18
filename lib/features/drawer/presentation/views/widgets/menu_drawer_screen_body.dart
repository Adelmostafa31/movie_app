import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/styles/colors.dart';

class menu_drawer_screen_body extends StatelessWidget {
  const menu_drawer_screen_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        left: width * 0.02,
        right: width * 0.3,
        top: height * 0.2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){},
            child: Container(
                alignment: AlignmentDirectional.center,
                width: width * 0.38,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: defualtColor(),
                    borderRadius: BorderRadius.circular(height * 0.03),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 50,
                          color: Colors.grey,
                          offset: Offset(0, 3))
                    ]),
                child: Padding(
                  padding:  EdgeInsets.only(left: width*0.02),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: height * 0.04,
                      ),
                      SizedBox(width: width*0.02,),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: height*0.03,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                )),
          ),
          SizedBox(height: height*0.04,),
          InkWell(
            onTap: (){},
            child: Container(
                alignment: AlignmentDirectional.center,
                width: width * 0.41,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: defualtColor(),
                    borderRadius: BorderRadius.circular(height * 0.03),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 50,
                          color: Colors.grey,
                          offset: Offset(0, 3))
                    ]),
                child: Padding(
                  padding:  EdgeInsets.only(left: width*0.02),
                  child: Row(
                    children: [
                      Icon(
                        EvaIcons.settings,
                        color: Colors.white,
                        size: height * 0.04,
                      ),
                      SizedBox(width: width*0.02,),
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: height*0.03,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                )),
          ),
          SizedBox(height: height*0.04,),
          InkWell(
            onTap: (){},
            child: Container(
                alignment: AlignmentDirectional.center,
                width: width * 0.433,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: defualtColor(),
                    borderRadius: BorderRadius.circular(height * 0.03),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 50,
                          color: Colors.grey,
                          offset: Offset(0, 3))
                    ]),
                child: Padding(
                  padding:  EdgeInsets.only(left: width*0.02),
                  child: Row(
                    children: [
                      Icon(
                        EvaIcons.alertCircle,
                        color: Colors.white,
                        size: height * 0.04,
                      ),
                      SizedBox(width: width*0.02,),
                      Text(
                        'About Us',
                        style: TextStyle(
                            fontSize: height*0.03,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
