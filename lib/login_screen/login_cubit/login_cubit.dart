import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_page/home_page.dart';
import '../../shared/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  void login({
    required String email,
    required String password,
    required context,
  }) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      uId = value.user!.uid;
      Navigator.push(context, MaterialPageRoute(builder: (builder) => const HomePage()));
    });
  }
}
