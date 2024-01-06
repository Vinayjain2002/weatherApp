import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weatherapp/DataFunctions/appbardata.dart';
import 'package:weatherapp/pages/dataBringingIcon.dart';
import '../pages/Main.dart';

//todo this page is for the purpose of the user login into the database and connecting with the server

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
TextEditingController email= TextEditingController();
TextEditingController password= TextEditingController();
class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: ListView(
          children:
            [
              Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Container(
                width: MediaQuery.of(context).size.height*1,
                padding: EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                    icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),),

              // we need to define the widget for the placing of the Registering here
              SizedBox(height: MediaQuery.of(context).size.height*0.055,),
              // register here
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.078),
                child: RichText(text: TextSpan(
                    text: "Welcome",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.18,color: Colors.white,fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: " Back",
                          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.lightBlueAccent)
                      )
                    ]
                )),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              //todo we need to define the email verifier ie if the username does not conatins the @ then we need to show a popup
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(26)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Icon
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.only(left: 0),
                        color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            // Your icon button action
                          },
                          icon: Icon(Icons.email, color: Colors.blue, size: 25),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Adjust the spacing between icon and text

                    // Text Field
                    Expanded(
                      child: Container(
                        child: TextField(
                          autocorrect: true,
                          autofocus: true,
                          controller: email,
                          cursorHeight: MediaQuery.of(context).size.height*0.035,
                          cursorColor: Colors.white54,
                          cursorWidth: 2,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10, bottom: 0),
                            border: InputBorder.none,
                            hintText: "Email..",
                            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),


              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(26)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Icon
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.only(left: 0),
                        color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            // Your icon button action
                          },
                          icon: Icon(Icons.lock, color: Colors.lightBlue, size: 25),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Adjust the spacing between icon and text

                    // Text Field
                    Expanded(
                      child: Container(
                        child: TextField(
                          autocorrect: true,
                          autofocus: true,
                          cursorColor: Colors.white54,
                          cursorHeight: MediaQuery.of(context).size.height*0.035,
                          controller: password,
                          cursorWidth: 2,
                          obscureText: true,
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10, bottom: 0),
                            border: InputBorder.none,
                            hintText: "Password..",
                            hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),

              // this is the final Submit Button
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.06,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                    ),
                    onPressed: () async{
                      // we are callig the api and then we will se the output
                      print("hello");
                      await Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>dataBringing(citiesList: possibleCities)),
                      );
                    },
                    child: Text("Submit",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white,letterSpacing: 1),)
                ),
              ),

            ],
          ),
                 ] ),
      ),
    );
  }
}



