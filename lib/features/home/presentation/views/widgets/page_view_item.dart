import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_state.dart';
import 'package:movie_app/features/home/presentation/views/widgets/carusal_home_body.dart';

class page_veiw_item extends StatelessWidget {
  const page_veiw_item({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<home_cubit, home_state>(
    builder: (context, state) {
      List<int> num = [0,1,2,3];
      var cubit = home_cubit.get(context);
      return PageView.builder(
        itemCount: num.length,
        controller: pageController,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context,num) => carusal_home_body(
          movie: cubit.home_data_list[num],
        ),
      );
    },);
  }
}
