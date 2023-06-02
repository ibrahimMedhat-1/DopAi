import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              'X-Ray History'),
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(5, 5), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: double.infinity,
              child: Column(
                children: [
                  Image(image: NetworkImage('https://img.youm7.com/ArticleImgs/2020/9/6/70452-orthoatlanta_facts_about_bone_fractures_image_1-resize.jpg')),
                  SizedBox(height: 10,),
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      '20 / 10 / 2010'),
                  SizedBox(height: 10,),
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      'He was injured in the foot while playing a football match '),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(5, 5), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 350,
                child: Column(
                  children: [
                    Image(image: NetworkImage('https://columbiaclinic.us/wp-content/uploads/2021/03/ankle-injury-sprained-or-broken-ankle-2.jpg')),
                    SizedBox(height: 10,),
                    Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        '20 / 10 / 2010'),
                    SizedBox(height: 10,),
                    Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        'He was injured in the foot while playing a football match '),
                  ],
                ),
              ),
            ])

    ),
        ));
  }
}
