import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_screen/Login.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  void signUp({
    required String email,
    required String password,
    required String name,
    required String age,
    required String gender,
    required String weight,
    required String height,
    required context,
  }) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      FirebaseFirestore.instance.collection('user').doc(value.user!.uid).set({
        'id': value.user!.uid.toString(),
        'name': name,
        'age': age,
        'gender': gender,
        'weight': weight,
        'height': height,
      }).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (builder) => Login()));
      });
    });
  }
}
