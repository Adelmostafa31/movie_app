import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_state.dart';
import 'package:movie_app/features/home/presentation/views/widgets/carusal_home_body.dart';
import 'package:movie_app/features/home/presentation/views/widgets/show_all_grid_view.dart';

class show_all_movies extends StatelessWidget {
   show_all_movies({Key? key, required this.movie}) : super(key: key);
   final movie_model movie;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<home_cubit,home_state>(
      builder: (context,state){
        var cubit = home_cubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: width * 0.01, top: height * 0.02),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: height * 0.05,
                  color: Colors.orange.withOpacity(0.7),
                ),
              ),
            ),
            toolbarHeight: height*0.1,
          ),
          body: Container(
            margin: EdgeInsets.only(bottom: height*0.02),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 2,
                childAspectRatio: 1 / 1.57,
                children: List.generate(cubit.home_data_list.length,
                      (index) {
                    return show_all_grid_view(movie: cubit.home_data_list[index],);
                  },
                )),
          ),
        );
      },
    );
  }
}
