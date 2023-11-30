import 'dart:convert';
import 'dart:ui';
import 'package:weatherapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:weatherapp/Worker.dart';
import 'package:weatherapp/pages/Main.dart';
import 'package:weatherapp/DataFunctions/appbardata.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Worker instance = Worker();

  Future<void> addLocations({String addLocation = ""}) async {
    if(possibleCities.length>10){
      while(possibleCities.length>10){
        possibleCities.removeLast();
      }
    }
    // writting the code to add the element in the WeatherLocations
    if(addLocation.length!=0){
      //adding the element
      possibleCities.add(addLocation);
    }
  }
  void fetchData() async{
    await addLocations();
    weatherData=await instance.getData(possibleCities);
    //todo now we are going to call the second screen of the data
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Main(weatherFetchedData: weatherData)));
  }
  void initState(){
    super.initState();
    fetchData();
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
          body: SafeArea(
            child: Stack(
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
          ),
        );
      }

  }
