import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/widgets/home_body.dart';

class home extends StatelessWidget {
  const home({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return home_body();
  }
}
