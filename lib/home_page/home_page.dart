import 'dart:io';

import 'package:dopproject/doctor_screen/doctor_screen.dart';
import 'package:dopproject/history_screen/history_screen.dart';
import 'package:dopproject/home_page/cubit/home_page_cubit.dart';
import 'package:dopproject/login_screen/Login.dart';
import 'package:dopproject/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../pharmacy_screen/pharmacy_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageTemporary;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..loadModel(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomePageCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.lightBlueAccent,
                title: Text(
                  'Bone Care',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>Profile()));
                    },
                    child: CircleAvatar(
                      radius: 40,
                    ),
                  )
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // image
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: const Image(
                            height: 200,
                            image: AssetImage('assets/Bone Care.png'),
                          ),
                        ),
                        const SizedBox(height: 60),
                        // row has upload button and detect button
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.lightBlueAccent,
                                ),
                                height: 70,
                                child: MaterialButton(
                                  onPressed: () async {
                                    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                                      imageTemporary = File(value!.path);
                                      cubit.classifyIfXray(imageTemporary!, context);
                                    });
                                  },
                                  child: const Center(
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child:
                                            Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28), 'Upload X-Ray')),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.lightBlueAccent,
                                ),
                                height: 70,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (builder) => History()));
                                  },
                                  child: const Center(
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child:
                                            Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28), 'X-Ray History')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.lightBlueAccent,
                                ),
                                height: 70,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (builder) => Doctor()));
                                  },
                                  child: const Center(
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28), 'Doctors')),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.lightBlueAccent,
                                ),
                                height: 70,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (builder) => Pharmacy()));
                                  },
                                  child: const Center(
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28), 'Pharmacy')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.lightBlueAccent,
                          ),
                          height: 50,
                          width: 150,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => Login()));
                            },
                            child: const Center(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                                  'Sign Out',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
