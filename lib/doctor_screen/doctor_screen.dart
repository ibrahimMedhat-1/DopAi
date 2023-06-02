import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            'Doctors'),
      ),
      body:SingleChildScrollView(
        child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
    children: [
    Row(
    children: [
    Expanded(
    child: Container(
    height: 30,
    margin: EdgeInsets.all(2),
    decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(20)),
    child: Center(
    child: DropDown(
    isExpanded: true,
    showUnderline: false,
    items: ["Cairo", "Giza", "Luxor", "Aswan", "Alexandria", "Qena","Menofia"],
    hint: Center(
    child: Text(
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
    'Government'
    ),
    ),
    icon: Icon(
    Icons.expand_more,
    color: Colors.white,
    ),
    ),
    ),
    ),
    ),
    ]),
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
                topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          width: double.infinity,
          child: Column(
            children: [
              Image(image: NetworkImage('https://scontent.fcai22-2.fna.fbcdn.net/v/t1.6435-9/117908035_1367161713486049_4362801163359341301_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=bEBJ2kfT_i8AX_iICiw&_nc_ht=scontent.fcai22-2.fna&oh=00_AfBTIKeaNb7NrbvlBr9L1XqcH66ffE7ksaGUz5IRqBT7hA&oe=64A139E3')),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'Dr : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        'Ibrahim Medhat Ibrahim'),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'Phone : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        '01064172976'),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'Address : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        'Maadi , st hassanin desoki '),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'E-mail : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        'ibrahim medhat@gmail.com'),
                  ),
                ],
              ),
            ],
          ),
        ),
    SizedBox(height: 20,),
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
                topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          width: double.infinity,
          child: Column(
            children: [
              Image(image: NetworkImage('https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/346636446_792501235543689_1412277024771011914_n.jpg?stp=cp6_dst-jpg_p843x403&_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=xIwChbF9c94AX8l6E2I&_nc_ht=scontent.fcai22-1.fna&oh=00_AfAEyW_amEhz4a3Fe8r6wscMhlx4kfWysaX2qk7UAX6VTA&oe=647E6C89')),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'Dr : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        'Mahmoud ElSobky'),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'Phone : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        '01026545330'),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'Address : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        'Maadi , st 9 street'),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                      'E-mail : '),
                  Expanded(
                    child: Text(
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        'Mahmoud ElSobky@gmail.com'),
                  ),
                ],
              ),
            ],
          ),
        ),

    ])
    ),
      ));
  }
}
