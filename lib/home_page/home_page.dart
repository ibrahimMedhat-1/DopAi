import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dopproject/home_page/cubit/home_page_cubit.dart';
import 'package:dopproject/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../shared/constants.dart';

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
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => Profile()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(imageUrl: image.toString(), placeholder: (context, url) => Image.asset('assets/2815428.png')),
                    ),
                  )
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.lightBlueAccent,
                        ),
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
                                child: Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28), 'Upload X-Ray')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: const Image(
                                  height: 200,
                                  image: AssetImage('assets/Bone Care.png'),
                                ),
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
