import 'package:flutter/material.dart';

class Detect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          'Detect X-Ray'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
                children: [
            Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: const Image(image: NetworkImage('https://my.clevelandclinic.org/-/scassets/images/org/health/articles/23500-foot-x-ray')),
      ),
        const SizedBox(height: 30),
            Text(
                'Broken',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.teal),
            ),
            const SizedBox(height: 20),
            Text(
                    'You need to see a doctor',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.teal),
                  )
            ]
          )
        )
      )
    );
  }
}
