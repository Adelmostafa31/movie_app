import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/movie_details.dart';

class list_view_home_item extends StatelessWidget {
  list_view_home_item({Key? key, required this.movie}) : super(key: key);
  final movie_model movie;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return InkWell(
        onTap: () {
          navigator2(
              context: context,
              widget: movie_details(
                image: movie.image_url!,
                title: movie.title!,
                overview: movie.overview!,
                veiws: movie.vote_count!,
                url: movie.youtube_url!,
                authorized: movie.isAuthorized!,
              ));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: height * 0.025),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(height * 0.03),
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.8),
                    offset: const Offset(0, 1))
              ]),
          child: Row(
            children: [
              Container(
                width: height * 0.1,
                height: height * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.03),
                    image: DecorationImage(
                        image: NetworkImage('${movie.image_url}'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Title :',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: height * 0.018,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        '${movie.title}',
                        style: TextStyle(
                            fontSize: height * 0.018,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Views :',
                        style: TextStyle(
                            fontSize: height * 0.02,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        '${movie.vote_count}',
                        style: TextStyle(
                            fontSize: height * 0.02,
                            color: Colors.redAccent.withOpacity(0.7),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Lottie.asset(
                'assets/images/player_light.json',
                width: height * 0.07,
                height: height * 0.07,
              )
            ],
          ),
        ));
  }
}
