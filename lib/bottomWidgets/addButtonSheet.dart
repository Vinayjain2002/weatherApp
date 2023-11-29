import 'package:flutter/material.dart';
import 'buttons.dart';

Widget addButtonBottomSheet(BuildContext context) {
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
                    child: hourlyWidget(context),
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

Widget hourlyWidget(BuildContext context) {
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