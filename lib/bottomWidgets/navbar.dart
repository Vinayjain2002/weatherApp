import 'package:flutter/material.dart';
import 'package:weatherapp/DataFunctions/appbardata.dart';

Widget appBar(BuildContext context,String text){
    // here we will store the possible locations that could be possible
    List<String>filterCities(String searchCity){
      return cities.where((city)=> city.toLowerCase().startsWith(searchCity.toLowerCase())).toList();
    }
// here we are going to create a function for the searching of the data
    return  Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: addFavourities,
        onSubmitted: (String value) {

        },
        onChanged: (String value){
          setState(){
            // so we had added the data to the filterCities ie the possible cities that could be possible
            possibleCities=filterCities(value);
          }
        },
        style: TextStyle(
          color: Colors.white70,
        ),
        decoration: InputDecoration(
          fillColor: Color(0xff181848),
          filled: true,
          contentPadding: EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width*0.3), // Adjust padding
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff0e0e3d),
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          hintText: "${text}",
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 5), // Adjust left and right padding
            child: Icon(
              Icons.search,
              color: Colors.white, // Icon color
              size: 27.0, // Icon size
            ),
          ),
        ),
      ),
    );
  }
