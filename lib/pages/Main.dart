import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherapp/Worker.dart';
import '../bottomWidgets/navbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weatherapp/bottomWidgets/bottomButtonsWidget.dart';
import 'package:weatherapp/WidgetsAll/mainScreenWeatherContainer.dart';

class Main extends StatefulWidget {
  final List<Map<String, dynamic>> weatherFetchedData;
  const Main({Key? key, required this.weatherFetchedData}) : super(key: key);

  // We are going to fetch the data into the Main.dart file for use
  @override
  State<Main> createState() => _HomeState();
}

class _HomeState extends State<Main> {
  TextEditingController searchController= new TextEditingController();
  TextEditingController addFavourities=new TextEditingController();
  // here we are going to create a function that will load the data
  List<String> cities=[];
  // ie the cities that could be possible on teh provided text in the TextField
  List<String>possibleCities=["Hisar","Panipat","Gurugram","Delhi"];

  // so we are going to creata a worker class instance for the purpose of the data fetching on the entering in the Textfield.
  Worker instance= new Worker();

  Future<void>addCities() async {
    // here we are going to bring the data to the file
    final String citiesJson=await rootBundle.loadString('images/cities.json');
    // now we are going to change the state such that the data changes and again load the screen
    setState(() {
      cities=List<String>.from(json.decode(citiesJson));
    });
  }

  Future<void>getData() async{
    // so we had called the getData async function
    await addCities();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF010153),
                    Color(0xff2f002f),
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),

                      // this is the weather text on the top
                      Text(
                        "WEATHER",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),

                  // // this is for the purpose of the navigtion bar
                  appBar(context,"Search for a city"),
                  // now we are going to implement a listbuilder that will show the data
                  Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.weatherFetchedData.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            SizedBox(height: MediaQuery.of(context).size.height * 0.018),
                            // Replace 'minTemp', 'weather_info', and 'location' with your actual keys
                            buildWeatherContainer(
                                context,
                                '${widget.weatherFetchedData[index]["minTemp"]}',
                                '${widget.weatherFetchedData[index]['weather_info']}',
                                '${widget.weatherFetchedData[index]['location']}',
                                '${widget.weatherFetchedData[index]['maxTemp']}',
                                '${widget.weatherFetchedData[index]['icon']}',
                                '${widget.weatherFetchedData[index]['description']}',
                                '${widget.weatherFetchedData[index]['windspeed']}',
                                '${widget.weatherFetchedData[index]['visiblity']}',
                                '${widget.weatherFetchedData[index]['rain']}',
                                '${widget.weatherFetchedData[index]['humidity']}',
                                '${widget.weatherFetchedData[index]['pressure']}',
                                '${widget.weatherFetchedData[index]['sunset']}',
                                '${widget.weatherFetchedData[index]['sunrise']}',
                                "sunny.png"
                            ),
                          ],
                        );
                      },
                    ),)


                ],
              ),

            ),
            Positioned(
                bottom: 0,
                left: (MediaQuery
                    .of(context)
                    .size
                    .width * 0.075), // Adjust the left position as needed
                right: (MediaQuery
                    .of(context)
                    .size
                    .width * 0.075),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.85,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: bottomButtons(context),
                )),
          ],
        ),
      ),
    );
  }
}