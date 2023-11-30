import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class fetchingData extends StatefulWidget {
  const fetchingData({super.key});

  @override
  State<fetchingData> createState() => _fetchingDataState();
}

class _fetchingDataState extends State<fetchingData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFF202052).withOpacity(0.9),
                  Color(0xff3a183a).withOpacity(0.9),
                ],
              )
          ),
          child: Center(

            child:  SpinKitSquareCircle(size: MediaQuery.of(context).size.width*0.2,color: Colors.white,)
          ),
        ),
      ),
    );
  }
}
