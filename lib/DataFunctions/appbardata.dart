// here we are going to import all the functions used by the appbar
import 'package:flutter/material.dart';
//so we had created the class for the centralised data of the cities

TextEditingController searchController= new TextEditingController();
TextEditingController addFavourities=new TextEditingController();
// ie the cities that could be possible on teh provided text in the TextField
List<String>possibleCities=["Hisar","Panipat","Gurugram","Delhi"];
List<Map<String,dynamic>> weatherFetchedData=[];

