import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/units/constance.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_state.dart';
import 'package:movie_app/features/home/presentation/views/show_all_movies.dart';
import 'package:movie_app/features/home/presentation/views/widgets/list_view_home_item.dart';
import 'package:movie_app/features/home/presentation/views/widgets/page_view_item.dart';
import 'package:movie_app/features/home/presentation/views/widgets/smooth_indecator.dart';

class home_body extends StatelessWidget {
  home_body({
    Key? key,
  }) : super(key: key);
  var carusal_home_item = PageController();
  var search_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<int> num = [4,5,6,8,1,3,7,9,12];
    return BlocBuilder<home_cubit, home_state>(
      builder: (context, state) {
        var cubit = home_cubit.get(context);
        return Scaffold(
          body: state is! get_home_data_loading_state
              ? Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                    right: width * 0.02,
                    top: height * 0.15,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Lottie.asset('assets/images/home_wight.json'),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        // page view item
                        SizedBox(
                            height: height * 0.53,
                            child: page_veiw_item(
                                pageController: carusal_home_item)),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        // indecator
                        Align(
                            alignment: AlignmentDirectional.center,
                            child: smooth_indecator(
                                pageController: carusal_home_item)),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Padding(
                              padding: EdgeInsets.only(right: width * 0.023),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                stopPauseOnTap: true,
                                animatedTexts: [
                                  WavyAnimatedText(
                                    'Show All',
                                    textStyle: TextStyle(
                                        fontFamily: 'Righteous',
                                        fontSize: height * 0.03,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                ],
                                onTap: () {
                                  navigator1(
                                      context: context,
                                      widget: show_all_movies(
                                        movie: cubit.movie!,
                                      ));
                                },
                                isRepeatingAnimation: true,
                              ),
                            )),
                        // list view home item
                        ListView.builder(
                          itemBuilder: (context, num) => list_view_home_item(
                            movie: cubit.home_data_list[num],
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: num.length,
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
