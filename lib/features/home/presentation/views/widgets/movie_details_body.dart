import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_state.dart';
import 'package:movie_app/features/home/presentation/views/home.dart';
import 'package:movie_app/features/home/presentation/views/widgets/details_screen_in_movie_details.dart';
import 'package:movie_app/features/home/presentation/views/widgets/arrow_back_movie_details.dart';
import 'package:movie_app/features/home/presentation/views/widgets/image_movie_details.dart';

class movie_details_body extends StatelessWidget {
  movie_details_body({Key? key, required this.image, required this.title, required this.overview, required this.veiws, required this.url, required this.authorized}) : super(key: key);
  final String image;
  final String title;
  final String overview;
  final String veiws;
  final String url;
  final bool authorized;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<home_cubit,home_state>(
      builder: (context,state){
        var cubit = home_cubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Column(
                children:  [
                  image_movie_details(image: image,),
                  details_screen_in_movie_details(title: title, overveiw: overview, views: veiws, url: url, authorized: authorized,),
                ],
              ),
              const arrow_back_movie_details(),
            ],
          ),
        );
      },
    );
  }
}
