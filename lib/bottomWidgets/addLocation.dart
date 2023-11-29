import 'package:flutter/material.dart';
import 'package:weatherapp/Worker.dart';

// so we had created a instance of the worker class for the purpose of the data
Worker instance= new Worker();

Widget addLocation(BuildContext context,String City){
  // so we had gotted the possiblecity
  List<Map<String,dynamic>>cityData=[];
  Future<void>FetchData() async{
    // here we are going to fetch the data of the indiviual card of the location.
    cityData=await instance.getData(City as List<String>);
  }
  FetchData();
  String color="0xff015e94";
  //todo we need to run such that it will first fetch the data and then it will runthe Return statement
  return Card(
    elevation: 5,
    shadowColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),

    child: Container(
        width: MediaQuery.of(context).size.width*0.89,
        height: MediaQuery.of(context).size.height*0.05,
        decoration: BoxDecoration(
          color: Color(0xff015e94).withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: (){
            color="0xFF566a75";
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 7),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.location_on,color: Colors.white,size: 20,),
                  SizedBox(width: 3,),
                  Text(City,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),)
                ],),
                Row(
                  children: <Widget>[
                    Text(cityData[0]["minTemp"],style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 18),)
                  ],
                )
              ],
            ),
          ),
        )
    ),
  );
}