// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/network/Cach_Helper/cach_helper.dart';
import 'package:movie_app/features/login_register/data/model/profile_model.dart';
import 'package:movie_app/features/login_register/presentation/manager/login_register_cubit/login_register_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class login_register_cubit extends Cubit<login_register_state>{
  login_register_cubit():super(login_register_intial_state());
  static login_register_cubit get(context) => BlocProvider.of(context);
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  profile_model? UserModel;
  // get user
  void getUser() {
    emit(get_user_loading_state());
    FirebaseFirestore.instance
        .collection('users')
        .doc(CachHelper.getData(key: 'uid'))
        .get()
        .then((value) {
      UserModel = profile_model.fromjson(value.data()!);
      emit(get_user_success_state());
    }).catchError((onError) {
      print(onError.toString());
      emit(get_user_error_state(onError.toString()));
    });
  }

  // user login
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(login_loading_state());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(login_success_state());
    }).catchError((onError) {
      print(onError.toString());
      emit(login_error_state(onError.toString()));
    });
  }

  // fire store data
  void createUser({
    required String name,
    required String email,
    required String uid,
    required String image,
  }) {
    profile_model model = profile_model(
        email: email,
        name: name,
        uid: uid,
        image:
        'https://i.pinimg.com/564x/27/01/f5/2701f51da94a8f339b2149ca5d15d2a5.jpg');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      getUser();
    }).catchError((onError) {
      print(onError.toString());
      emit(creat_user_error_state(onError.toString()));
    });
  }

  // register user
  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(register_loading_state());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CachHelper.saveData(value: value.user!.uid, key: 'uid');
      createUser(
          name: name,
          email: email,
          uid: value.user!.uid,
          image: '');
    }).catchError((onError) {
      print(onError.toString());
      emit(register_error_state(onError.toString()));
    });
  }

  // sign in with google
  void signInWithGoogle() async {
    emit(sign_in_with_google_loading_state());
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      CachHelper.saveData(value: value.user!.uid, key: 'uid');
      createUser(
          name: value.user!.displayName!,
          email: value.user!.email!,
          uid: value.user!.uid,
          image: value.user!.photoURL!);
    }).catchError((onError) {
      print(onError.toString());
      emit(sign_in_with_google_error_state(onError.toString()));
    });
  }

  // pick profile image
  File? profileImage;
  var profilePicker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickerFile =
    await profilePicker.getImage(source: ImageSource.gallery);

    if (pickerFile != null) {
      print(pickerFile.path);
      profileImage = File(pickerFile.path);
      emit(picked_image_success_state());
    } else {
      print('No Image Selected');
      emit(picked_image_error_state());
    }
  }


  // upload profile image
  String profileImageUrl = '';

  void uploadProfileImage() {
    emit(upload_profile_loading_state());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        print(profileImageUrl);
        updateUserImage();
        // emit(UploadProfileSuccessState());
      }).catchError((Error) {
        print(Error.toString());
        emit(upload_profile_error_state1());
      });
      // updateUserImage();
    }).catchError((Error) {
      print(Error.toString());
      emit(upload_profile_error_state2());
    });
  }

  // update profile image
  void updateUserImage() {
    emit(update_user_loading_state());
    FirebaseFirestore.instance
        .collection('users')
        .doc(CachHelper.getData(key: 'uid'))
        .update({'image': profileImageUrl}).then((value) {
      // getUser();
      emit(update_user_success_state());
    }).catchError((onError) {
      emit(update_user_error_state());
    });
  }
}