import 'package:flutter/material.dart';

import '../DataFunctions/appbardata.dart';
import '../Worker.dart';
import 'Main.dart';
//todo this page is for the purpose of te data bringing from the server and then redirecting the page to the
//todo Main.dart which is the main screen fro the data Bringing

class dataBringing extends StatefulWidget {
  final List <String>citiesList;
  const dataBringing({super.key, required this.citiesList});

  @override
  State<dataBringing> createState() => _dataBringingState();
}
// going to create a instance of the class for the purpose of the feching the data According to the REquirements of teh users

class _dataBringingState extends State<dataBringing> {
  @override
  Worker instance = new Worker();

  void fetchData() async{
    weatherFetchedData=await instance.getData(widget.citiesList);
    //todo now we are going to call the second screen of the data
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Main(weatherFetchedData: weatherFetchedData)));

  }

  void initState() {
    // TODO: implement initState
    super.initState();
     fetchData();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.black87,
                Colors.black87,
                Colors.black
              ]
            )
          ),
          child: Column(
            // here we will insert a animation that will show that the data is bringing
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // so here we are going to bring out the data
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  //todo need to remove the background color of the gif
                  child: Image.asset('images/animation01.gif'),
                ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
                child: RichText(text: TextSpan(
                    text: "Bringing data far ",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.06,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing:1, wordSpacing: 2),
                    children: const <TextSpan>[
                      TextSpan(
                          text: "from the Clouds",
                          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.lightBlueAccent)
                      )
                    ]
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
