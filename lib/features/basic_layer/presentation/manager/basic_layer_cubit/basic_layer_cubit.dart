import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/basic_layer/presentation/manager/basic_layer_cubit/basic_layer_state.dart';
import 'package:movie_app/features/category/presentation/views/category.dart';
import 'package:movie_app/features/home/presentation/views/home.dart';

class basic_layer_cubit extends Cubit<basic_layer_state> {
  basic_layer_cubit() : super(intial_basic_layer_state());
  static basic_layer_cubit get(context) => BlocProvider.of(context);
  ////////////// Screens Bottom Navigation Bar //////////////////
  List<Widget> screens = [
    const home(),
    const category(),
  ];
  int currentIndexBottomNav = 0;
  void ChangeBottomNav(int index) {
    currentIndexBottomNav = index;
    emit(change_bottom_nav_state());
  }



  ////////////// Drawer //////////////////
  bool isDrawer = false;
  double y = 0;
  double x = 0;
  void ChangeDrawer(bool isDraw){
    isDrawer = isDraw;
    isDrawer ? y = 80 : y = 0;
    isDrawer ? x = 290 : x = 0;
    emit(change_drawer_state());
  }
}