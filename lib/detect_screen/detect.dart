import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dopproject/detect_screen/detect_cubit/detect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Detect extends StatelessWidget {
  File image;

  Detect({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetectCubit()
        ..loadModel()
        ..classifyLungImage(image),
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
                            image,
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
                      )
                    ])))),
          );
        },
      ),
    );
  }
}
