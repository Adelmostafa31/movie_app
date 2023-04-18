import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/movie_details.dart';

class show_all_grid_view extends StatelessWidget {
  const show_all_grid_view({Key? key,required this.movie}) : super(key: key);
  final movie_model movie;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        navigator2(context: context, widget:  movie_details(
          image: movie.image_url! ,
          title: movie.title!,
          overview: movie.overview!,
          veiws: movie.vote_count!,
          url: movie.youtube_url!,
          authorized: movie.isAuthorized!,
        )
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: width * 0.02,
              top: height * 0.02,
              right: width * 0.02,
            ),
            alignment: AlignmentDirectional.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 0.02),
              image:  DecorationImage(
                image: NetworkImage(
                  '${movie.image_url}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: height * 0.08,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.symmetric(horizontal: width * 0.07),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(height * 0.02),
            ),
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4,
                    sigmaY: 4,
                  ),
                  child: Container(),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(height * 0.02),
                      border: Border.all(color: Colors.white.withOpacity(0.5))
                  ),
                  child: Text(
                    '${movie.title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
