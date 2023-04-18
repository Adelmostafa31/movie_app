import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class image_movie_details extends StatelessWidget {
  image_movie_details({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.6,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(height * 0.07),
            bottomRight: Radius.circular(height * 0.07),
          ),
          image:  DecorationImage(
            image: NetworkImage('${image}'),
            fit: BoxFit.cover,
          )),
    );
  }
}
