import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherapp/WidgetsAll/locationBox.dart';
import '../WidgetsAll/locationSunBox.dart';
import '../bottomWidgets/bottomButtonsWidget.dart';


class Location extends StatefulWidget {
  const Location({Key? key,
    required this.location,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.sunrise,
    required this.rain_cond,
    required this.windspeed,
    required this.weather_info,
    required this.visiblity,
    required this.sunset,
    required this.condition,
  }) : super(key: key);

  final String location;
  final String temperature;
  final String humidity;
  final String pressure;
  final String sunrise;
  final String rain_cond;
  final String windspeed;
  final String weather_info;
  final String visiblity;
  final String sunset;
  final String condition;
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Map<String, dynamic>> boxData = [];

  @override
  void initState() {
    super.initState();

    // Initialize boxData using widget.windspeed
    boxData = [
      {'icon': const Icon(Icons.air), 'data': widget.windspeed,'description': 'wind Speed'},
      {'icon': const Icon(Icons.arrow_downward), 'data': widget.pressure,'description': 'Pressure'},
      {'icon': const Icon(Icons.opacity), 'data': widget.humidity,'description': 'Humidity'},
      {'icon': const Icon(Icons.beach_access), 'data': widget.rain_cond,'description': 'Rain Condition'},
      {'icon': const Icon(Icons.remove_red_eye), 'data': widget.visiblity,'description': 'Visiblity'},
      {'icon': const Icon(Icons.info), 'data': widget.weather_info,'description': 'Weather Info'},
    ];
    print(boxData.length);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color(0xFF010165),
                        Color(0xFF420342),
                      ]
                  )
              ),

              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    Text(widget.location,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 40,color: Color(
                        0xFFBDBDBE)),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Text>[
                        Text('${widget.temperature}°C ',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color( 0xFFBDBDBE)),),
                        Text('| ${widget.condition}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Color(
                            0xFF3592FC)),),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    // now we are going to place the boxes for the details of the data
                    sunBox(context,widget.sunrise,widget.sunset,const Icon(Icons.wb_sunny),const Icon(Icons.brightness_3)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.015,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 1.2,
                        ),
                          scrollDirection: Axis.vertical,
                          itemCount: boxData.length,
                          itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: detailBoxes(context,boxData[index]["data"],boxData[index]["icon"],boxData[index]["description"]),
                              );

                          },
                      ),
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  ],),
              ),

            ),

            // we are going to place the bottom sheet
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
                  width: MediaQuery.of(context).size.width*1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xFF351350).withOpacity(0.5),
                          Color(0xFF420342).withOpacity(0.5),
                        ]
                    ),
                  ),
                  height: MediaQuery.of(context).size.height*0.1,
                  child: bottomButtons(context),
                )),
          ],

        ),
      ),
    );
  }


}
