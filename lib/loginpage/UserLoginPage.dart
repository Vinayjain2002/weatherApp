import 'package:flutter/material.dart';
import 'package:weatherapp/loginpage/GoogleLogin.dart';
import 'PhoneLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'RegisterNewUser.dart';
import 'SignUp.dart';
//todo we need to make it responsive if not
//todo we need to make the google login page

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
        width: double.infinity,
        height: double.infinity,
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
        child: Column(

          children: <Widget>[
            // here we will place the user login details
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              // Icon of the spotify
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height*0.3,
                child: Image.asset('images/umb.png',fit: BoxFit.cover,),
              ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Text("See beyond the clouds",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.11,fontWeight: FontWeight.w600,color:               Colors.white,),textAlign: TextAlign.center,),

              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                }, child: Text("Sign up for free",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19,color: Colors.white)),
                onHover: (value){

                },
                  style: ElevatedButton.styleFrom(primary: Colors.blue,
                      elevation: 5,
                    padding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: Colors.white70,width: 1),
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical: MediaQuery.of(context).size.height*0.012),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneLogin()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.mobile_screen_share,size: MediaQuery.of(context).size.width*0.07,color: Colors.white,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Flexible(
                  child: Text(
                    "Continue With Phone no",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white,),
                  ),
                ),
              ],
            ),
            onHover: (value) {
              // Your onHover logic
            },
          ),
        ),


        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical: MediaQuery.of(context).size.height*0.012),
                    side: BorderSide(
                    width: 1,
                    color: Colors.white70
                  )
                ),
                onHover: (value){

                },
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>googleLogin()));
                },
                child: Row(
                children: <Widget>[
                  Container(child: Icon(Icons.person,color: Colors.white,size: MediaQuery.of(context).size.width*0.07,),),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  Container(
                    child: Text("Continuing with Google",softWrap: true,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                  )
                ],
              ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.045,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterUser()));
              },
              child: Text("Log in",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white,letterSpacing: 1),),
            )

          ],
        ),
      ),
    );
  }
}
