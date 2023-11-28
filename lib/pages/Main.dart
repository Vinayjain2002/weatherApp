import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'location.dart';
import 'package:weatherapp/pages/loading.dart';

class Main extends StatefulWidget {
  final List<Map<String, dynamic>> weatherFetchedData;
  const Main({Key? key, required this.weatherFetchedData}) : super(key: key);

  // We are going to fetch the data into the Main.dart file for use
  @override
  State<Main> createState() => _HomeState();
}

class _HomeState extends State<Main> {
  TextEditingController searchController= new TextEditingController();
  TextEditingController addFavourities=new TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFF010153),
                  Color(0xff2f002f),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),

                    // this is the weather text on the top
                    Text(
                      "WEATHER",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),

                // this is for the purpose of the navigtion bar
                navBar(),
                // now we are going to implement a listbuilder that will show the data
                Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.weatherFetchedData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height * 0.018),
                        // Replace 'minTemp', 'weather_info', and 'location' with your actual keys
                        buildWeatherContainer(
                          '${widget.weatherFetchedData[index]["minTemp"]}',
                          '${widget.weatherFetchedData[index]['weather_info']}',
                          '${widget.weatherFetchedData[index]['location']}',
                          '${widget.weatherFetchedData[index]['maxTemp']}',
                          '${widget.weatherFetchedData[index]['icon']}',
                          '${widget.weatherFetchedData[index]['description']}',
                          '${widget.weatherFetchedData[index]['windspeed']}',
                          '${widget.weatherFetchedData[index]['visiblity']}',
                          '${widget.weatherFetchedData[index]['rain']}',
                          '${widget.weatherFetchedData[index]['humidity']}',
                          '${widget.weatherFetchedData[index]['pressure']}',
                          '${widget.weatherFetchedData[index]['sunset']}',
                          '${widget.weatherFetchedData[index]['sunrise']}',
                          "sunny.png"
                        ),
                      ],
                    );
                  },
                ),)


              ],
            ),

          ),
            Positioned(
                bottom: 0,
                left: (MediaQuery
                    .of(context)
                    .size
                    .width * 0.075), // Adjust the left position as needed
                right: (MediaQuery
                    .of(context)
                    .size
                    .width * 0.075),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.85,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // this is for the porpose of adding the location into the screen
                      bottomLocationButton(),
                      // this is for the central btn of the screen
                      bottomAddButton(),
                      // THIS is for the purpose of the changing of the settings
                      bottomMenuButton(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget navBar(){
    return  Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: searchController,
        onSubmitted: (String value) {
        },
        style: TextStyle(
          color: Colors.white70,
        ),
        decoration: InputDecoration(
          fillColor: Color(0xff181848),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width*0.3), // Adjust padding
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff0e0e3d),
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          hintText: "Search for a city",
          hintStyle: TextStyle(
            fontSize: 20,
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

  Widget buildWeatherContainer(
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


  Widget bottomAddButton() {
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
                return addButtonBottomSheet();
              }
          );
        },
        color: Colors.black,

      ),
    );
  }

  Widget bottomMenuButton() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext) {
                return addMenuBottomSheet(
                  "320","100","10","cloudy","60","rain",
                );
              }
          );
        },
        color: Colors.white,
        iconSize: 30,
      ),
    );
  }

  Widget bottomLocationButton() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.location_on,),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return addLocationBottomSheet("5");
            },
          );
        },
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }

  Widget hourlyWidget() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF06041a),
                Color(0xFF2e0b4a),
              ]
          )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 22,),
          Text("12 AM", style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white),),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.08,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.2,
            child: Image.asset("images/sun.png"),
          ),
          SizedBox(height: 10,),
          Text("20°C",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),)
        ],
      ),
    );
  }

  Widget addMenuBottomSheet(
      String temperature,
      String windspeed,
      String visiblity,
      String weather_info,
      String uv_Index,
      String rain,
      ) {
    List<Map<String,dynamic>>Icon_values=[];
    if(int.parse(temperature)>303){
      // we are going to add the conditions of the hot weather
      Icon_values.add({'icon': Icon(Icons.wb_sunny), 'description': 'Hot Outside',});
      Icon_values.add({'icon': Icon(Icons.local_drink),'description': 'Drink Cold Drinks'});
      Icon_values.add({'icon': Icon(Icons.shield),'description': 'Use Suns Cream'});
    }
    // if(int.parse(rain)>3 && int.parse(rain)<6){
    //   // there are the chances of the raining outside
    //   Icon_values.add({'icon': Icon(Icons.water_drop),'description': "Rainfall"});
    //   Icon_values.add({'icon': Icon(Icons.umbrella),'description': "Take Umberalla"});
    //   Icon_values.add({'icon': Icon(Icons.directions_car),'description': "Traffic"});
    // }
    // if(int.parse(temperature)<290){
    //   // here is the condition of the cold
    //   Icon_values.add({'icon': Icon(Icons.ac_unit),'description': 'Cold Outside'});
    // }
    // if(int.parse(rain)>6){
    //   Icon_values.add({'icon': Icon(Icons.water_drop),'description': 'Heavy Rainfall'});
    // }

    return Stack(
        children: <Widget>[
          Container(width: MediaQuery
              .of(context)
              .size
              .width * 1,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF202052),
                    Color(0xff3a183a),
                  ],
                )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),
                // this container is for the purpose of the creation of a black line in the sliding window
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black45,
                  ),
                  height: 5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                  child: Container(
                    // here we are going to place the items ie the diferent annotations of the data

                    child: ListView.builder(itemCount: Icon_values.length,itemBuilder: (context,index){
                      if(index+2<Icon_values.length){
                        // here we will create a Container that will display the 3 elements
                        return Padding(padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  //todo we need to define the icon to be placed here

                                ],
                              ),
                            ),

                          ],
                        ),);
                      }
                    })
                  ),

                ),
              ],
            ),
          ),

          // this is the again placing of our three btn at the bottom
          Positioned(
              bottom: 0,
              left: (MediaQuery
                  .of(context)
                  .size
                  .width * 0.075), // Adjust the left position as needed
              right: (MediaQuery
                  .of(context)
                  .size
                  .width * 0.075),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // this is for the porpose of adding the location into the screen
                    bottomLocationButton(),
                    // this is for the central btn of the screen
                    bottomAddButton(),
                    // THIS is for the purpose of the changing of the settings
                    bottomMenuButton(),
                  ],
                ),
              ))
        ]
    );
  }

  Widget addButtonBottomSheet() {
    return Stack(
        children: <Widget>[
          Container(width: MediaQuery
              .of(context)
              .size
              .width * 1,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF202052),
                    Color(0xff3a183a),
                  ],
                )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),
                // this container is for the purpose of the creation of a black line in the sliding window
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black45,
                  ),
                  height: 5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.05,),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery
                          .of(context)
                          .size
                          .width * 0.02,),
                      child: hourlyWidget(),
                    );
                  }, itemCount: 6, scrollDirection: Axis.horizontal,),
                ),
              ],
            ),
          ),
          // now we will create the list of the items
          // this is the again placing of our three btn at the bottom
          Positioned(
              bottom: 0,
              left: (MediaQuery
                  .of(context)
                  .size
                  .width * 0.075), // Adjust the left position as needed
              right: (MediaQuery
                  .of(context)
                  .size
                  .width * 0.075),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // this is for the porpose of adding the location into the screen
                    bottomLocationButton(),
                    // this is for the central btn of the screen
                    bottomAddButton(),
                    // THIS is for the purpose of the changing of the settings
                    bottomMenuButton(),
                  ],
                ),
              ))
        ]
    );
  }
  Widget addLocation(){
    String color="0xff015e94";
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
                    Text("Panipat",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),)
                  ],),
                  Row(
                    children: <Widget>[
                      Text("217°C",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 18),)
                    ],
                  )
                ],
              ),
          ),
        )
      ),
    );
  }
  Widget appBar(){
    return  Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: addFavourities,
        onSubmitted: (String value) {
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

          hintText: "Add favourities",
          hintStyle: TextStyle(
            fontSize: 16,
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
  Widget addLocationBottomSheet(String temperature) {
    return Stack(
        children: <Widget>[
          Container(width: MediaQuery
              .of(context)
              .size
              .width * 1,
            height: MediaQuery
                .of(context)
                .size
                .height *0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF202052),
                    Color(0xff3a183a),
                  ],
                )
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),
                // this container is for the purpose of the creation of a black line in the sliding window
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black45,
                  ),
                  height: 5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("Manage Cities",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white54),),
                      ),
                      appBar(),
                      Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        height: MediaQuery.of(context).size.height*0.33,
                        child: ListView.builder(itemCount: 10,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return Padding(padding: EdgeInsets.only(top: 7),
                            child: Container(
                                child: addLocation()),);
                          },
                        ),
                      )
                      // SizedBox(height: 10,),
                      // addLocation(),
                    ],
                  ) ,
                ),
              ],
            ),
          ),
          // now we will create the list of the items

          // this is the again placing of our three btn at the bottom
          Positioned(
              bottom: 0,
              left: (MediaQuery
                  .of(context)
                  .size
                  .width * 0.075), // Adjust the left position as needed
              right: (MediaQuery
                  .of(context)
                  .size
                  .width * 0.075),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // this is for the porpose of adding the location into the screen
                    bottomLocationButton(),
                    // this is for the central btn of the screen
                    bottomAddButton(),
                    // THIS is for the purpose of the changing of the settings
                    bottomMenuButton(),
                  ],
                ),
              ))
        ]
    );
  }

}

