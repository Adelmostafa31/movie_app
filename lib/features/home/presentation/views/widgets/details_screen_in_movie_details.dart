import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/widgets/watch_screen_in_movie_details.dart';

class details_screen_in_movie_details extends StatelessWidget {
  details_screen_in_movie_details(
      {Key? key, required this.title, required this.overveiw, required this.views, required this.url, required this.authorized})
      : super(key: key);
  final String title;
  final String overveiw;
  final String views;
  final String url;
  final bool authorized;

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
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02, left: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.only(bottom: height * 0.02),
                width: width * 0.4,
                height: height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(height * 0.035)),
                child: Text(
                  'Details',
                  style: TextStyle(
                      fontSize: height * 0.05,
                      color: Colors.white),
                ),
              ),
              const Spacer(),
              authorized == true
                  ? InkWell(
                  onTap: () {
                    navigator2(context: context,
                        widget: watch_screen_in_movie_details(url: url,));
                  },
                  child: Lottie.asset(
                    'assets/images/player_light.json',
                    width: height * 0.12,
                    height: height * 0.12,
                  ))
                  : Padding(
                padding:EdgeInsets.only(bottom: height*0.02,right: width*0.05),
                child: Text(
                  'Soon',
                  style: TextStyle(
                      fontSize: height * 0.035,
                      color: Colors.orange),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Title :',
                style: TextStyle(
                    fontSize: height * 0.03,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Text(
                '${title}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: height * 0.027,
                    color: Colors.black,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            children: [
              Text(
                'Views :',
                style: TextStyle(
                    fontSize: height * 0.03,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Text(
                '${views}',
                style: TextStyle(
                    fontSize: height * 0.03,
                    color: Colors.redAccent.withOpacity(0.7),
                    ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Text(
            'Overview :',
            style: TextStyle(
                fontSize: height * 0.03,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '${overveiw}',
            style: TextStyle(
                fontSize: height * 0.03,
                color: Colors.black,
                ),
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
