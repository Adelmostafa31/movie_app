import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movie_details_body.dart';

class movie_details extends StatelessWidget {
  movie_details({Key? key, required this.image, required this.title, required this.overview, required this.veiws, required this.url, required this.authorized}) : super(key: key);
  final String image;
  final String title;
  final String overview;
  final String veiws;
  final String url;
  final bool authorized;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: movie_details_body(image: image, title: title, overview: overview, veiws: veiws, url: url, authorized: authorized,),
    );
  }
}

