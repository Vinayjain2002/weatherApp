// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../loginpage/UserLoginPage.dart';

//todo here we are going to create a page that will show the data related to the login page of the webpage and then it will be re
//todo redirected to the sign up and the login page

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLoginPage()));
    });
      //this is the function for the bringing the data from the app
  }

      @override
      void setState(VoidCallback fn) {
        // TODO: implement setState
        super.setState(fn);
      }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              // Other containers or widgets
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: const <Color>[
                      Color(0xFF013D69),
                      Color(0xff026fb7),
                      const Color(0xFF013D69),
                    ],
                  ), // <-- Add closing parenthesis here
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset('images/umb.png'),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        Text(
                          "Weather App",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                        Text(
                          "Your Quick Weather Report",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                        SpinKitThreeBounce(
                          color: Colors.white70,
                          size: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Attribution section placed at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Created with",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w700),),
                      SizedBox(width: 6,),
                      const Icon(Icons.favorite, color: Colors.red, size: 25),
                      const SizedBox(width: 6,),
                      const Text("by Vinay Jain",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w800),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

  }
