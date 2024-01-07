import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'OTP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}
TextEditingController phoneno= TextEditingController();
class _PhoneLoginState extends State<PhoneLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo we need to remove the scaffold from here
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
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset('images/user.png', fit: BoxFit.contain,),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Text("Phone Verification",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                Container(
                    child: Text(
                      "We need to register your Phone before getting started!.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: "+91",
                              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: 1,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: phoneno,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 13),
                              hintText: 'Phone',
                              hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            width: 1,
                            color: Colors.white70
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: Colors.lightBlue.withOpacity(0.5)
                    ),
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP(
                          // we need to pass the phone no and pin
                          phoneNumber: phoneno.text.toString(),
                      verificationId: "mvme")));

                    },
                    child: Text("Send the code",
                        style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
