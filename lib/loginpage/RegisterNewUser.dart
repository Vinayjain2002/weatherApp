// import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:weatherapp/DataFunctions/appbardata.dart';
import 'package:weatherapp/pages/dataBringingIcon.dart';

// import '../pages/Main.dart';
import 'package:firebase_database/firebase_database.dart';


//todo this page is for the purpose of the new user registeration
class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController username=TextEditingController();
class _RegisterUserState extends State<RegisterUser> {
  @override

  // creating the instnce for the purpose of the user registeration
  final DatabaseReference database = FirebaseDatabase.instance.ref();

  // this function is for the purpose of testing the password of the user
  bool passwordChecking(String enteredPassword) {
    // Check if the password meets the specified conditions
    bool hasMinLength = enteredPassword.length >= 8;
    bool hasUpperCase = enteredPassword.contains(RegExp(r'[A-Z]'));
    bool hasDigit = enteredPassword.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = enteredPassword.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    // Return true if all conditions are met
    return hasMinLength && hasUpperCase && hasDigit && hasSpecialChar;
  }

  bool emailChecking(String emailEntered) {
    // Regular expression for a simple email validation
    // This regex allows for most common email formats but may not cover all edge cases
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    // Check if the entered email matches the regex
    return emailRegex.hasMatch(emailEntered);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xFF5193C2),
                    Color(0xff1d6da2),
                    Color(0xFF026FB7),
                  ]
              )
          ),
          child: ListView(
            children:[ Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Container(
                  width: MediaQuery.of(context).size.height*1,
                  padding: const EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                      icon: const Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),),

                // we need to define the widget for the placing of the Registering here
                SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                // register here
                RichText(text: TextSpan(
                    text: "Register",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.13,color: Colors.white,fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      const TextSpan(
                          text: " Here",
                          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.lightBlueAccent)
                      )
                    ]
                )),

                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
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
                          padding: const EdgeInsets.only(left: 0),
                          color: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              // Your icon button action
                            },
                            icon: const Icon(Icons.person, color: Colors.blue, size: 25),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust the spacing between icon and text

                      // Text Field
                      Expanded(
                        child: Container(
                          child: TextField(
                            autocorrect: true,
                            controller: username,
                            cursorColor: Colors.white54,
                            cursorHeight: MediaQuery.of(context).size.height*0.035,
                            cursorWidth: 2,
                            style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 18),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10, bottom: 0),
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.025,),

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
                          padding: const EdgeInsets.only(left: 0),
                          color: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              // Your icon button action
                            },
                            icon: const Icon(Icons.email, color: Colors.blue, size: 25),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust the spacing between icon and text

                      // Text Field
                      Expanded(
                        child: Container(
                          child: TextField(
                            autocorrect: true,
                            controller: email,
                            cursorHeight: MediaQuery.of(context).size.height*0.035,
                            cursorColor: Colors.white54,
                            cursorWidth: 2,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 22),
                            decoration: const InputDecoration(
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
                          padding: const EdgeInsets.only(left: 0),
                          color: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              // Your icon button action
                            },
                            icon: const Icon(Icons.lock, color: Colors.blue, size: 25),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust the spacing between icon and text

                      // Text Field
                      Expanded(
                        child: Container(
                          child: TextField(
                            autocorrect: true,
                            cursorColor: Colors.white54,
                            cursorHeight: MediaQuery.of(context).size.height*0.035,
                            controller: password,
                            cursorWidth: 2,
                            obscureText: true,
                            style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 22),
                            decoration: const InputDecoration(
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
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)

                      ),
                      onPressed: () async{
                        // // we need to store the user credentials inside the firebase server
                        //todo we need to define the code here that will look at the necessary conditions ie the email format and the password

                        //todo this function is for the purpose of testing the password entered bt the user
                        bool passwordChecked=await  passwordChecking(password.value.text);
                        bool emailChecked= await emailChecking(email.value.text);

                        if(passwordChecked){
                          print("the password is correct");
                        }
                        else{
                          print("Password is not too much strog");
                          return;
                        }

                        if(emailChecked){
                          print("Email is strong");
                        }
                        else{
                          print("email is not too much strong");
                          return;
                        }
                        // this code if for the purpose of the linking the firebase with the application
                        try{
                          await database.child(email.value.text).set(
                              {
                                "name": username.value.text,
                                "email": email.value.text,
                                "password": password.value.text,
                              }
                          );
                        }
                        catch(e){
                          print("the error occured is the ");
                          print(e);
                        }
                        print("done");
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>dataBringing(citiesList: possibleCities)),
                        );
                      },
                      child: const Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white,letterSpacing: 1),)
                  ),
                ),

              ],
            ),
          ]),
        ),
      ),
    );
  }
}
