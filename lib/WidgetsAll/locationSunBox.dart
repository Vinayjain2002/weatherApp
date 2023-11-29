import 'package:flutter/material.dart';

Widget sunBox(BuildContext context,String sunrise,sunset,Icon sunriseIcon,Icon sunsetIcon){
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
