import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movie_app/features/basic_layer/presentation/views/basic_layer.dart';
import 'package:movie_app/features/drawer/presentation/views/widgets/menu_screen.dart';
import 'package:movie_app/features/home/presentation/views/home.dart';
import 'package:movie_app/features/home/presentation/views/movie_details.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:   [
          menu_screen(),
          basic_layer(),
        ],
      ),
    );
  }
}
