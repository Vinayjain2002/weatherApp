import 'package:flutter/material.dart';
import 'buttons.dart';

Widget bottomButtons(BuildContext context){
  return Container(
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
  );
}
