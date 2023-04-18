import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/category/presentation/manager/category_cubit/category_state.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class category_cubit extends Cubit<category_state>{
  category_cubit() : super(category_intial_state());

  static category_cubit get(context) => BlocProvider.of(context);
  movie_model? movie;

  // get action
  List<movie_model> action_list = [];
  void get_action_data() {
    emit(get_category_loading_state());
    FirebaseFirestore.instance
        .collection('Action')
        .get()
        .then((value) {
      action_list = [];
      value.docs.forEach((element) {
        action_list.add(movie_model.fromjson(element.data()));
        movie = movie_model.fromjson(element.data());
      });
      emit(get_category_success_state());
    }).catchError((onError) {
      print(onError.toString());
      emit(get_category_error_state(onError.toString()));
    });
  }

  // get adventure
  List<movie_model> adventure_list = [];
  void get_adventure_data() {
    emit(get_category_loading_state());
    FirebaseFirestore.instance
        .collection('Adventure')
        .get()
        .then((value) {
      adventure_list = [];
      value.docs.forEach((element) {
        adventure_list.add(movie_model.fromjson(element.data()));
        movie = movie_model.fromjson(element.data());
      });
      emit(get_category_success_state());
    }).catchError((onError) {
      print(onError.toString());
      emit(get_category_error_state(onError.toString()));
    });
  }

  // get horror
  List<movie_model> horror_list = [];
  void get_horror_data() {
    emit(get_category_loading_state());
    FirebaseFirestore.instance
        .collection('Horror')
        .get()
        .then((value) {
      horror_list = [];
      value.docs.forEach((element) {
        horror_list.add(movie_model.fromjson(element.data()));
        movie = movie_model.fromjson(element.data());
      });
      emit(get_category_success_state());
    }).catchError((onError) {
      print(onError.toString());
      emit(get_category_error_state(onError.toString()));
    });
  }

  // get cartoon
  List<movie_model> cartoon_list = [];
  void get_cartoon_data() {
    emit(get_category_loading_state());
    FirebaseFirestore.instance
        .collection('Cartoon')
        .get()
        .then((value) {
      cartoon_list = [];
      value.docs.forEach((element) {
        cartoon_list.add(movie_model.fromjson(element.data()));
        movie = movie_model.fromjson(element.data());
      });
      emit(get_category_success_state());
    }).catchError((onError) {
      print(onError.toString());
      emit(get_category_error_state(onError.toString()));
    });
  }
}