import 'package:flutter/material.dart';
import 'navbar.dart';
import 'buttons.dart';
import 'addLocation.dart';
import 'package:weatherapp/DataFunctions/appbardata.dart';

//here we are going to import the data related to the
Widget addLocationBottomSheet(BuildContext context,String temperature) {
  return Stack(
      children: <Widget>[
        Container(width: MediaQuery
            .of(context)
            .size
            .width * 1,
          height: MediaQuery
              .of(context)
              .size
              .height *0.6,
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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text("Manage Cities",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white54),),
                    ),
                    appBar(context,"Favourity cities"),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.33,
                      child: ListView.builder(itemCount: possibleCities.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return Padding(padding: EdgeInsets.only(top: 7),
                            child: Container(
                              //todo here we need to add the things related to the container ie temp and the location
                                child: addLocation(context,weatherFetchedData[index]["location"],weatherFetchedData[index]["minTemp"]),
                            ),
                          );
                        },
                      ),
                    )
                    // SizedBox(height: 10,),
                    // addLocation(),
                  ],
                ) ,
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