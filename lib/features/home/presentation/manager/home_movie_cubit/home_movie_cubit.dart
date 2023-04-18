import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_state.dart';

class home_cubit extends Cubit<home_state>{
  home_cubit() : super(home_intial_state());
  static home_cubit get(context) => BlocProvider.of(context);

  movie_model? movie;

  List<movie_model> home_data_list = [];

  void get_home_data() {
    emit(get_home_data_loading_state());
    FirebaseFirestore.instance
        .collection('home')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        home_data_list.add(movie_model.fromjson(element.data()));
        movie = movie_model.fromjson(element.data());
      });
      emit(get_home_data_success_state());
    }).catchError((onError) {
      print(onError.toString());
      emit(get_home_data_error_state());
    });
  }
}