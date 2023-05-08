import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

import 'Login.dart';

class SignUp extends StatelessWidget {

  TextEditingController userName= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController Password= TextEditingController();
  TextEditingController age= TextEditingController();
  TextEditingController wight= TextEditingController();
  TextEditingController height= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Register Now',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal,fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: userName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                    ),
                        labelText: 'User Name',labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal,fontStyle: FontStyle.italic,),
                        prefixIcon: Icon(Icons.person,color: Colors.teal,)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                    ),
                        labelText: 'E-Mail',labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal,fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.email,color: Colors.teal,)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: Password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                    ),
                        labelText: 'Password',labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal,fontStyle: FontStyle.italic),
                        prefixIcon: Icon(Icons.lock,color: Colors.teal),
                        suffixIcon: Icon(Icons.remove_red_eye,color: Colors.teal)

                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: age,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                          ),
                            labelText: 'Age',labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal,fontStyle: FontStyle.italic),
                            prefixIcon: Icon(Icons.date_range_outlined,color: Colors.teal),

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          height: 60,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: DropDown(
                              isExpanded: true,
                              showUnderline: false,
                              items: const ["Male","Female"],
                              hint: const Center(
                                child: Text(style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), "Gender"),
                              ),
                              icon: const Icon(
                                Icons.expand_more,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: wight,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                          ),
                            labelText: 'wight',labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal,fontStyle: FontStyle.italic),
                            prefixIcon: Icon(Icons.arrow_right_alt,color: Colors.teal),

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                          controller: height,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                          ),
                            labelText: 'height',labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal,fontStyle: FontStyle.italic),
                            prefixIcon: Icon(Icons.height,color: Colors.teal),

                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25,),
                  ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                        elevation: 10.0,
                        textStyle: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                    child: const Text('Create an account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
