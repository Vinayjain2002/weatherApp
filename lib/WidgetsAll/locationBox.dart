import 'package:flutter/material.dart';

Widget detailBoxes(BuildContext context,String value ,Icon icon_value,String type_var,){
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
    ),
    shadowColor: Colors.blue,

    child: Container(
      height: MediaQuery.of(context).size.height*0.15,
      width: MediaQuery.of(context).size.width*0.43,
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
            padding: const EdgeInsets.only(top: 13,left: 8),
            child: Row(
              children: <Widget>[
                Icon(icon_value.icon,
                  size: 23,
                  color: Colors.white,
                ),
                SizedBox(width: 8,),
                Text(type_var,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),)
              ],
            ),
          ),

          // now we are going to plave the value
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Text(value,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),
            softWrap: true,),
          )
        ],

      ),
    ),
  );
}