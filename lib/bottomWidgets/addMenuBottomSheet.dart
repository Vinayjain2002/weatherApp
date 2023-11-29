import 'package:flutter/material.dart';
import 'buttons.dart';

Widget addMenuBottomSheet(
    BuildContext context,
    String temperature,
    String windspeed,
    String visiblity,
    String weather_info,
    // String how to push the flutter code on teh github from the android studiouv_Index,
    String rain,
    ) {
  List<Map<String, dynamic>> Icon_values = [
    {'icon': Icon(Icons.wb_sunny), 'description': 'Hot Outside'},
    {'icon': Icon(Icons.local_drink), 'description': ' Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': 'Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': ' Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': ' Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': ' Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': ' Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': ' Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': 'Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': 'Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': 'Cold Drinks'},
    {'icon': Icon(Icons.local_drink), 'description': 'Cold Drinks'},
  ];

  return Stack(
      children: <Widget>[
        Container(width: MediaQuery
            .of(context)
            .size
            .width * 1,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.45,
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
              SizedBox(height: 20,),
              // here we are going to create a list builder that will show the data of the different life conditions
              Container(
                // here we are going to place the items ie the diferent annotations of the data\
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height*0.32,
                  child: ListView.builder(
                      itemCount: Icon_values.length,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(),
                      itemBuilder: (context,index){
                        if(index+2<Icon_values.length){
                          // here we will create a Container that will display the 3 elements
                          return Padding(padding: EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Use SizedBox to add space between icon and text if needed
                                        Icon(
                                          Icon_values[index]["icon"].icon,
                                          color: Colors.white70,
                                          size: 20,
                                        ),
                                        SizedBox(height: 4), // Adjust the height as needed
                                        Text(
                                          Icon_values[index]['description'],
                                          softWrap: true,
                                          textAlign: TextAlign.center, // Align text to the center
                                          style: TextStyle(color: Colors.white54,fontSize: 11,fontWeight: FontWeight.w300), // Optional: Set text color
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Use SizedBox to add space between icon and text if needed
                                        Icon(
                                          Icon_values[index]["icon"].icon,
                                          color: Colors.white70,
                                          size: 20,
                                        ),
                                        SizedBox(height: 4), // Adjust the height as needed
                                        Text(
                                          Icon_values[index]['description'],
                                          softWrap: true,
                                          textAlign: TextAlign.center, // Align text to the center
                                          style: TextStyle(color: Colors.white54,fontSize: 11,fontWeight: FontWeight.w300), // Optional: Set text color
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Use SizedBox to add space between icon and text if needed
                                        Icon(
                                          Icon_values[index]["icon"].icon,
                                          color: Colors.white70,
                                          size: 20,
                                        ),
                                        SizedBox(height: 4), // Adjust the height as needed
                                        Text(
                                          Icon_values[index]['description'],
                                          softWrap: true,
                                          textAlign: TextAlign.center, // Align text to the center
                                          style: TextStyle(color: Colors.white54,fontSize: 11,fontWeight: FontWeight.w300), // Optional: Set text color
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),);
                        }
                      })
              ),
            ],
          ),
        ),

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
                  bottomLocationButton(context),
                  // this is for the central btn of the screen
                  bottomAddButton(context),
                  // THIS is for the purpose of the changing of the settings
                  bottomMenuButton(context),
                ],
              ),
            ))
      ]
  );
}