import 'package:flutter/material.dart';
import 'addLocationsSheet.dart';
import 'addButtonSheet.dart';
import 'addMenuBottomSheet.dart';

Widget bottomLocationButton(BuildContext context) {
  return Container(
    child: IconButton(
      icon: Icon(Icons.location_on,),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return addLocationBottomSheet(context,"5");
          },
        );
      },
      iconSize: 30,
      color: Colors.white,
    ),
  );
}

// now we are going to define the code for the bootomAddButton
Widget bottomAddButton(BuildContext context) {
  return Container(
    height: MediaQuery
        .of(context)
        .size
        .height * 0.095,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext) {
              return addButtonBottomSheet(context);
            }
        );
      },
      color: Colors.black,

    ),
  );
}

// now we are going to import the bottomMenu Button
Widget bottomMenuButton(BuildContext context) {
  return Container(
    child: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext) {
              return addMenuBottomSheet(context,
                "320","100","10","cloudy","60",
              );
            }
        );
      },
      color: Colors.white,
      iconSize: 30,
    ),
  );
}