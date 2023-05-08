import 'package:dopproject/home_page.dart';
import 'package:dopproject/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  TextEditingController email= TextEditingController();
  TextEditingController Password= TextEditingController();

  var formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(image: NetworkImage('https://media.gemini.media/img/Medium/2021/3/6/2021_3_6_15_43_49_998.jpg')),
                  ),
                  const SizedBox(height: 30),
                  Text('Login',
                    style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.teal),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                    ),
                        hintText: 'Enter your E-Mail',
                        labelText: 'E-Mail',labelStyle: TextStyle(color: Colors.teal,),
                        prefixIcon: Icon(Icons.email,color: Colors.teal,)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: Password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                    ),
                        hintText: 'Enter your Password',
                        labelText: 'Password',labelStyle: TextStyle(color: Colors.teal),
                        prefixIcon: Icon(Icons.lock,color: Colors.teal),
                        suffixIcon: Icon(Icons.remove_red_eye,color: Colors.teal)

                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                        elevation: 10.0,
                        textStyle: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    child: const Text('LOGIN'),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ?',),
                      SizedBox(width: 10,),
                      TextButton(onPressed: ()
                      {
                       Navigator.push(context, MaterialPageRoute(builder: (builder)=>SignUp()));
                      },
                          child: Text('Register Now',style: TextStyle(color: Colors.teal),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
