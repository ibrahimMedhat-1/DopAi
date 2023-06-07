import 'package:dopproject/login_screen/Login.dart';
import 'package:dopproject/profile/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>ProfileCubit()..Profile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
     var cubit = ProfileCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png'),
                          radius: 100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Icon(
                          Icons.person,color: Colors.lightBlueAccent,size: 50),
                      SizedBox(width: 20,),
                      Text(
                        '${cubit.name} ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(
                          Icons.email,color: Colors.lightBlueAccent,size: 50),
                      SizedBox(width: 20,),
                      Text(
                        '${cubit.email}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                                Icons.calendar_month,color: Colors.lightBlueAccent,size: 50),
                            SizedBox(height: 20,),
                            Text(
                              '${cubit.age}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                                Icons.scale,color: Colors.lightBlueAccent,size: 50),
                            SizedBox(height: 20,),
                            Text(
                              '${cubit.weight}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                                Icons.height,color: Colors.lightBlueAccent,size: 50),
                            SizedBox(height: 20,),
                            Text(
                              '${cubit.height}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Login()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      elevation: 10.0,
                      textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text('Sign Out'),
                ),
              ),
                ],
              ),
            ),
          ),
        ),
      );
  },
),
    );
  }
}
