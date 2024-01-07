import 'package:flutter/material.dart';
import 'package:weatherapp/Worker.dart';
import 'package:weatherapp/DataFunctions/appbardata.dart';
import 'package:weatherapp/Worker.dart';
import '../pages/Main.dart';
import'package:weatherapp/WidgetsAll/fetchingData.dart';

TextEditingController addFavourities = TextEditingController();
TextEditingController addFavouritiesSheet= TextEditingController();

Future<void> fetchData() async {
  Worker instance = Worker();
  weatherFetchedData = await instance.getData(possibleCities);
  // so we had fetched the data
}

Widget appBar(BuildContext context, String text) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: TextField(
      controller: addFavourities,
      onSubmitted: (value) async {
        // Handle the submitted value
        print('Submitted: $value');
        // we need to fetch the data from the server also
        Navigator.push(context, MaterialPageRoute(builder: (context) => fetchingData()));
        possibleCities.insert(0, value);
        await fetchData();
        // Navigate to Main screen using Navigator.push
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Main(weatherFetchedData: weatherFetchedData), // Adjust data accordingly
          ),
        );
      },
      style: TextStyle(
        color: Colors.white70,
      ),
      decoration: InputDecoration(
        fillColor: Color(0xff181848),
        contentPadding:
        EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.3), // Adjust padding
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
