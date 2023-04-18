import 'package:flutter/material.dart';
import 'package:movie_app/features/category/presentation/views/widget/category_body.dart';
class category extends StatelessWidget {
  const category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: category_body(),
    );
  }
}
