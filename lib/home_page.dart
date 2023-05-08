import 'dart:io';

import 'package:dopproject/Login.dart';
import 'package:dopproject/detect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? imageTemporary;
  void pickImage() async
  {
     await ImagePicker().pickImage(source: ImageSource.gallery).then((value){

    imageTemporary = File(value!.path);
    setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: imageTemporary==null?const Image(image: NetworkImage(
                        'https://media.gemini.media/img/Medium/2021/3/6/2021_3_6_15_43_49_998.jpg')):Image.file(imageTemporary!),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'What do you want...?',
                    style: TextStyle(fontSize: 29.8,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.teal,
                          ),
                          height: 70,
                          child: MaterialButton(
                            onPressed: () {
pickImage();
},
                            child: Expanded(
                              child: Center(
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28), 'Upload X-Ray')),
                              ),
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.teal,
                          ),
                          height: 70,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (builder) => Detect()));
                            },
                            child: Expanded(
                              child: Center(
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28), 'Detect X-Ray')),
                              ),
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
                      color: Colors.teal,
                    ),
                    height: 50,
                    width: 150,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            builder) => Login()));
                      },
                      child: Expanded(
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              style:
                              TextStyle(color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                              'Sign Out',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}