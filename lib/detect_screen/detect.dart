import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dopproject/detect_screen/detect_cubit/detect_cubit.dart';
import 'package:dopproject/home_page/home_page.dart';
import 'package:dopproject/shared/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Detect extends StatefulWidget {
  File image;

  Detect({super.key, required this.image});

  @override
  State<Detect> createState() => _DetectState();
}

class _DetectState extends State<Detect> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetectCubit()
        ..loadModel()
        ..classifyLungImage(widget.image),
      child: BlocConsumer<DetectCubit, DetectState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = DetectCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), 'Detect X-Ray'),
            ),
            body: ConditionalBuilder(
                condition: cubit.outputs != null,
                fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Center(
                          child: Image.file(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        cubit.outputs![0]['label'].toString() == '0 Broken' ? 'Broken' : 'Non - Broken',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.teal),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        cubit.outputs![0]['label'].toString() == '0 Broken' ? 'You need to see a doctor' : 'You are okay',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.teal),
                      ),
                      const SizedBox(height: 40),
                      if (cubit.outputs![0]['label'].toString() == '0 Broken')
                        Column(
                          children: [
                            TextFormField(
                              controller: cubit.notes,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'Write your Notes',
                                  labelText: 'Notes',
                                  labelStyle: const TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.bold),
                                  prefixIcon: const Icon(
                                    Icons.note_add_outlined,
                                    color: Colors.teal,
                                    size: 25,
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            !loading
                                ? ElevatedButton(
                                    onPressed: () {
                                      loading = true;
                                      setState(() {});
                                      FirebaseStorage.instance.ref().child('doctor/${DateTime.now()}').putFile(widget.image).then((value) {
                                        value.ref.getDownloadURL().then((value) {
                                          FirebaseFirestore.instance.collection('user').doc(uId).collection('history').add({
                                            'image': value.toString(),
                                            'date': DateTime.now().toString(),
                                            'note': cubit.notes.text.toString(),
                                          }).then((value) {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomePage()));
                                          });
                                        });
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal,
                                        elevation: 10.0,
                                        textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                    child: const Text('Add To History'),
                                  )
                                : CircularProgressIndicator(),
                          ],
                        ),
                    ])))),
          );
        },
      ),
    );
  }
}
