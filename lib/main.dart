import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/Cach_Helper/cach_helper.dart';
import 'package:movie_app/core/styles/themes/ThemeData.dart';
import 'package:movie_app/core/units/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_app/features/basic_layer/presentation/views/basic_layer.dart';
import 'package:movie_app/features/basic_layer/presentation/manager/basic_layer_cubit/basic_layer_cubit.dart';
import 'package:movie_app/features/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:movie_app/features/drawer/presentation/views/drawer.dart';
import 'package:movie_app/features/home/presentation/manager/home_movie_cubit/home_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/views/movie_details.dart';
import 'package:movie_app/features/login_register/presentation/manager/login_register_cubit/login_register_cubit.dart';
import 'package:movie_app/features/splash/presentation/views/splash.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CachHelper.init();
  await Firebase.initializeApp();
  runApp(const movie_app());
}
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = MyBlocObserver();
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const movie_app(), // Wrap your app
//     ),
//   );
// }

class movie_app extends StatelessWidget {
  const movie_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<basic_layer_cubit>(create: (BuildContext contect)=> basic_layer_cubit()),
        BlocProvider<login_register_cubit>(create: (BuildContext contect)=> login_register_cubit()),
        BlocProvider<home_cubit>(create: (BuildContext contect)=> home_cubit()..get_home_data()),
        BlocProvider<category_cubit>(create: (BuildContext contect)=> category_cubit()
          ..get_action_data()
          ..get_adventure_data()
          ..get_cartoon_data()
          ..get_horror_data()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme,
        home:  const splash_screen(),
      ),
    );
  }
}

