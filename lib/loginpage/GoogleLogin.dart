import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//todo i need to create a page for the google login
class googleLogin extends StatefulWidget {
  const googleLogin({super.key});

  @override
  State<googleLogin> createState() => _googleLoginState();
}

class _googleLoginState extends State<googleLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // here we will create the page for login by the user
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[

                    Color(0xFF5193C2),
                    Color(0xff1d6da2),
                    const Color(0xFF026FB7),
                  ]
              )
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: ListView(
                children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Container(
              width: MediaQuery.of(context).size.height*1,
              padding: EdgeInsets.all(0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),),
                ]
              ,),
          ),
        ),
      ),
    );
  }
}
