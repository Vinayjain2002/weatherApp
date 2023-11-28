import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
  @override
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

                child: Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    child:  Column(
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        Text(widget.location,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40,color: Color(
                            0xFFBDBDBE)),),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Text>[
                            Text('${widget.temperature}°C ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color( 0xFFBDBDBE)),),
                            Text('| ${widget.condition}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Color(
                                0xFF3592FC)),),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        // now we are going to place the boxes for the details of the data
                        sunBox(widget.sunrise,widget.sunset,Icon(Icons.wb_sunny),Icon(Icons.brightness_3)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: MediaQuery.of(context).size.height*0.6,
                          child: GridView.count(crossAxisCount: 2,
                            childAspectRatio: 1.18, // Adjust this ratio to control the width of the items
                            crossAxisSpacing: MediaQuery.of(context).size.width*0.02,
                            mainAxisSpacing: MediaQuery.of(context).size.height*0.01,
                            children: <Widget>[

                            detailBoxes(widget.windspeed,Icon(Icons.air), 'WindSpeed'),
                            detailBoxes(widget.pressure,Icon(Icons.arrow_downward), 'Pressure'),
                            detailBoxes(widget.humidity,Icon(Icons.water_drop), 'Humidity'),
                            detailBoxes(widget.rain_cond,Icon(Icons.wb_sunny), 'Rain'),
                              //todo we need to add the icons according to the weather api icons
                              detailBoxes(widget.weather_info, Icon(Icons.wb_sunny), "Weather"),
                                            ],
                                          ),
                        ),

                                  ],),
                  ),
                ),
              // Positioned(
              //     bottom: 0,
              //     left: (MediaQuery
              //         .of(context)
              //         .size
              //         .width * 0.075), // Adjust the left position as needed
              //     right: (MediaQuery
              //         .of(context)
              //         .size
              //         .width * 0.075),
              //     child: Container(
              //       width: MediaQuery
              //           .of(context)
              //           .size
              //           .width * 0.85,
              //       height: MediaQuery.of(context).size.height*0.08,
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: <Widget>[
              //           // this is for the porpose of adding the location into the screen
              //           bottomLocationButton(),
              //           // this is for the central btn of the screen
              //           bottomAddButton(),
              //           // THIS is for the purpose of the changing of the settings
              //           bottomMenuButton(),
              //         ],
              //       ),
              //     )),
            ],

          ),
        ),
    );
  }
  Widget sunBox(String sunrise,sunset,Icon sunriseIcon,Icon sunsetIcon){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.blue,
      child: Container(
        height: MediaQuery.of(context).size.height*0.18,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF13165B).withOpacity(0.9),
                Color(0xff2f002f),
              ]
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15),
          child: Column(
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //for the purpose of the icon and the name ie sunset
                  Column(
                    children: <Widget>[
                      Icon(sunsetIcon.icon,size: 27,color: Colors.white,),
                      Text("Sunset",style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w400,color: Colors.white),)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(sunriseIcon.icon,size: 25,color: Colors.white,),
                      Text("Sunrise",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),)
                    ],
                  )
                ],
              ),
              // This containert is for the purpose of a horizontal rule
                SizedBox(height: MediaQuery.of(context).size.height*0.016,),
              Container(
                  width: MediaQuery.of(context).size.width*0.6,
                   height: 2,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('${sunset}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,color: Colors.white),),
                Text('${sunrise}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,color: Colors.white),),
              ],),
            ],
          ),
        ),
      ),

    );
  }

  Widget detailBoxes(String value ,Icon icon_value,String type_var,){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
    ),
      shadowColor: Colors.blue,

      child: Container(
        height: MediaQuery.of(context).size.height*0.12,
        width: MediaQuery.of(context).size.width*0.36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFF13165B).withOpacity(0.9),
              Color(0xff2f002f),
            ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // we are going to first print the logo and the name
            Padding(
              padding: const EdgeInsets.only(top: 13,left: 10),
              child: Row(
                  children: <Widget>[
                    Icon(icon_value.icon,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10,),
                    Text(type_var,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),)
                  ],
              ),
            ),

            // now we are going to plave the value
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: Text(value,style: TextStyle(fontSize: 39,fontWeight: FontWeight.w700,color: Colors.white),),
            )
          ],

        ),
      ),
    );
  }


  Widget bottomAddButton() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.095,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext) {
                return addButtonBottomSheet();
              }
          );
        },
        color: Colors.black,

      ),
    );
  }

  Widget bottomMenuButton() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext) {
                return addMenuBottomSheet();
              }
          );
        },
        color: Colors.white,
        iconSize: 30,
      ),
    );
  }

  Widget bottomLocationButton() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.location_on,),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return addLocationBottomSheet("5");
            },
          );
        },
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }

  Widget hourlyWidget() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF06041a),
                Color(0xFF2e0b4a),
              ]
          )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 22,),
          Text("12 AM", style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white),),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.08,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.2,
            child: Image.asset("images/sun.png"),
          ),
          SizedBox(height: 10,),
          Text("20°C",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),)
        ],
      ),
    );
  }

  Widget addMenuBottomSheet() {
    return Stack(
        children: <Widget>[
          Container(width: MediaQuery
              .of(context)
              .size
              .width * 1,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF202052),
                    Color(0xff3a183a),
                  ],
                )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),
                // this container is for the purpose of the creation of a black line in the sliding window
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black45,
                  ),
                  height: 5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                ),
              ],
            ),
          ),
          // now we will create the list of the items

          // this is the again placing of our three btn at the bottom
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // this is for the porpose of adding the location into the screen
                    bottomLocationButton(),
                    // this is for the central btn of the screen
                    bottomAddButton(),
                    // THIS is for the purpose of the changing of the settings
                    bottomMenuButton(),
                  ],
                ),
              ))
        ]
    );
  }

  Widget addButtonBottomSheet() {
    return Stack(
        children: <Widget>[
          Container(width: MediaQuery
              .of(context)
              .size
              .width * 1,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF202052),
                    Color(0xff3a183a),
                  ],
                )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),
                // this container is for the purpose of the creation of a black line in the sliding window
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black45,
                  ),
                  height: 5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.05,),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery
                          .of(context)
                          .size
                          .width * 0.02,),
                      child: hourlyWidget(),
                    );
                  }, itemCount: 6, scrollDirection: Axis.horizontal,),
                ),
              ],
            ),
          ),
          // now we will create the list of the items
          // this is the again placing of our three btn at the bottom
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // this is for the porpose of adding the location into the screen
                    bottomLocationButton(),
                    // this is for the central btn of the screen
                    bottomAddButton(),
                    // THIS is for the purpose of the changing of the settings
                    bottomMenuButton(),
                  ],
                ),
              ))
        ]
    );
  }

  Widget addLocationBottomSheet(String temperature) {
    return Stack(
        children: <Widget>[
          Container(width: MediaQuery
              .of(context)
              .size
              .width * 1,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF202052),
                    Color(0xff3a183a),
                  ],
                )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),
                // this container is for the purpose of the creation of a black line in the sliding window
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black45,
                  ),
                  height: 5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                ),
              ],
            ),
          ),
          // now we will create the list of the items

          // this is the again placing of our three btn at the bottom
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // this is for the porpose of adding the location into the screen
                    bottomLocationButton(),
                    // this is for the central btn of the screen
                    bottomAddButton(),
                    // THIS is for the purpose of the changing of the settings
                    bottomMenuButton(),
                  ],
                ),
              ))
        ]
    );
  }
}
