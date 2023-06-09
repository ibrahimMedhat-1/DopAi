import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dopproject/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  var name;
  var email;
  var age;
  var height;
  var weight;
  var image = null;

  void Profile() {
    FirebaseFirestore.instance.collection('user').doc(uId).get().then((value) {
      name = value.data()!['name'];
      email = value.data()!['email'];
      age = value.data()!['age'];
      height = value.data()!['height'];
      weight = value.data()!['weight'];
      image = value.data()!['image'];
      image = this.image;
      emit(Users());
    }).then((value) {
      print(image);
    });
  }
}
