import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tflite/tflite.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  static HomePageCubit get(context) => BlocProvider.of(context);
  List? outputs;
  String? imageIs;
  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/xray_assuring_model/model_unquant.tflite',
      labels: 'assets/xray_assuring_model/labels.txt',
    ).then((value) {
      emit(LoadModelSuccess());
      print('okay');
    }).catchError((onError) {
      print('error');
      emit(LoadModelError());
    });
  }

  classifyIfXray(File image, context) async {
    await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    ).then((value) {
      debugPrint(value.toString());
      outputs = value;
      imageIs = outputs![0]['label'].toString();
      debugPrint(imageIs.toString());
      // Tflite.close();
      if (imageIs == '0 xray') {
        emit(ImageIsXray());
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('You want to detect this xray ?'),
                  content: Image.file(image),
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  actions: [
                    MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.pop(context);
                          emit(ImageIsNotXray());
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        )),
                    MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          Navigator.pop(context);
                          emit(ImageIsNotXray());
                        },
                        child: Text(
                          'Detect',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ));
      } else {
        Fluttertoast.showToast(
            msg: 'please insert valid xray',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 16.0);
        emit(ImageIsNotXray());
      }
    }).catchError((onError) {
      debugPrint('error classify');
      debugPrint(onError.toString());
      // Tflite.close();
      emit(ClassifyIfXrayError());
    });
    // Tflite.close();
  }
}
