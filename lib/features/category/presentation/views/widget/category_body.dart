import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/category/presentation/manager/category_cubit/category_state.dart';
import 'package:movie_app/features/category/presentation/views/widget/action_category_screen.dart';
import 'package:movie_app/features/category/presentation/views/widget/adventure_category_screen.dart';
import 'package:movie_app/features/category/presentation/views/widget/cartoon_category_screen.dart';
import 'package:movie_app/features/category/presentation/views/widget/horror_category_screen.dart';
import 'package:movie_app/features/category/presentation/views/widget/tab_bar_category.dart';

class category_body extends StatelessWidget {
  const category_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<category_cubit,category_state>(
      builder: (context,state){
        var cubit = category_cubit.get(context);
        return  state is! get_category_loading_state
            ? DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const tab_bar_category(),
                Expanded(
                  child: TabBarView(children: [
                    action_category_screen(cubit: cubit),
                    horror_category_screen(cubit: cubit),
                    adventure_category_screen(cubit: cubit),
                    cartoon_category_screen(cubit: cubit),
                  ]),
                ),
              ],
            ),
          ),
        )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
