import 'package:flutter/material.dart';
import '../pages/location.dart';

Widget buildWeatherContainer(
    BuildContext context,
    String temperature,
    String condition,
    String city,
    String max_Temp,
    String icon,
    String description,
    String windspeed,
    String visiblity,
    String rain,
    String humidity,
    String pressure,
    String sunset,
    String sunrise,
    String image_name,
    ) {
  return InkWell(
    onTap: (){
      // here we create a function to pass to the different page
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Location(
            location: city,
            temperature: temperature,
            humidity: humidity,
            pressure: pressure,
            sunrise: sunrise,
            rain_cond: rain,
            windspeed: windspeed,
            weather_info: description,
            visiblity: visiblity,
            sunset: sunset,
            condition: condition,
          ),)
      );
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.21,
      padding: EdgeInsets.only( left: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Color(0xFF016EB9),
            Color(0xFF000066),
          ],
        ),
      ),
      // here we are going to get  the next to the data and the text
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // Add this line
              children: <Widget>[
                SizedBox(height: 20,),
                Text(temperature, style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*0.1, color: Colors.white),),
                // SizedBox(height: 5),
                Text(condition, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),),
                Text(city, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.white),),
              ],
            ),
            // This container is for the purpose of the image and will be used for that
            Container(
              width: MediaQuery.of(context).size.width*0.42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Image.asset("images/$image_name"),],
              ),
            ),
          ],
        ),
      ),

      // Add your widgets for data here
    ),
  );
}