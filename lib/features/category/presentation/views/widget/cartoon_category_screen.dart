import 'package:flutter/material.dart';
import 'package:movie_app/features/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/category/presentation/views/widget/list_view_category_item.dart';

class cartoon_category_screen extends StatelessWidget {
  const cartoon_category_screen({Key? key, required this.cubit}) : super(key: key);
  final category_cubit cubit;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemBuilder: (context, index) => SizedBox(
        height: height*0.53,
        child:  list_view_category_item(movie: cubit.cartoon_list[index]),
      ),
      itemCount: cubit.cartoon_list.length,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
    );
  }
}
