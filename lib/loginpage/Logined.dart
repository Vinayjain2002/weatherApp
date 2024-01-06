import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();

List<Color> colors = [Colors.brown, Colors.purple, Colors.blueGrey];

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late int index; // Declare the index variable

  @override
  void initState() {
    super.initState();
    // Initialize the index in the initState method
    index = randomIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo container is showing one above the another

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              colors[index],
              Colors.black87
            ]
          )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Container(
              color: Colors.black87,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.15,


              child: Text(
                "V",
                style: TextStyle(fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.15
                ),
                      textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 16),
                      hintText: "Your name",
                    ),
                    autocorrect: true,
                    controller: nameController,
                    cursorColor: Colors.white70,
                    cursorWidth: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int randomIndex() {
  Random random = Random();
  int randomIndex = random.nextInt(colors.length - 1);
  return randomIndex;
}
