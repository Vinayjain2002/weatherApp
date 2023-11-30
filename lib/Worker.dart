import 'dart:convert';
import 'package:http/http.dart';

//this dart file is for the data bringing from the api and returning a list of the map of the data
//todo we  need to fetch the data also
class Worker {

  final String api_key="50dc1a509ae7f239b531f6017895fce1";
  String geLongLatApi='http://api.openweathermap.org/geo/1.0/direct?q=';
  String getWeatherApi="https://api.openweathermap.org/data/2.5/weather?lat=";
  String temperature="";

  List locations=[];
  List<Map<String, dynamic>> Directions = [];
  List<Map<String, dynamic>> WeatherReport = [];
  String humidity="";
  String pressure="";
  String sunrise="";
  String sunset="";
  String rain="";
  String weather_info="";
  String windSpeed="";
  String visiblity="";
  String icon="";
  String description="";
  String minTemp="";
  String maxTemp="";
  String location_value = "";

  Future<void> getLongLat() async {
    // Make an HTTP GET request to get latitude and longitude data
    try {
      for( String location in locations) {
        final getLongLatUrl='${geLongLatApi}${location}&appid=${api_key}';
        final response = await get(Uri.parse(getLongLatUrl));
        if (response.statusCode == 200) {
          // Parse the response JSON if the request is successful
          List data = jsonDecode(response.body);
          Map mapLongLats=data[0];
          String longs=mapLongLats["lon"].toString();
          String lats=mapLongLats["lat"].toString();

          // now we are going to add the longs and the lat's in a map
          Directions.add({'location': '${location}','longitude': '${longs}', 'latitude': '${lats}'});
          // so we had succesfully added the longitude and the lattitudes
        }
        else {
          // Handle error cases
          print('Failed to load data. Status Code: ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  Future<void> getWeatherReport() async {
    await getLongLat();
    print("hello");

    //todo now we are feching the weather data and going to store the data in the map
    for(var map in Directions){
      // so we had created a function for the different locations data
      String longitude=map["longitude"];
      String lattitude=map["latitude"];
      print("the value of the longitude and the lattitude is");
      print(longitude);
      print(lattitude);
      String getWeatherReportUrl='${getWeatherApi}${lattitude}&lon=${longitude}&appid=${api_key}';
      print(getWeatherReportUrl);
      Response response=await get(Uri.parse(getWeatherReportUrl));
      print(response.statusCode);
      try {
        if (response.statusCode == 200) {
          // so it's the success and we had gotten the data
          // map["location"].toString().ca
          location_value=map["location"].toString().substring(0,1).toUpperCase()+ map["location"].toString().substring(1);
          Map data = jsonDecode(response.body);
          Map currentSunrise = data["sys"];
          print(currentSunrise);

          var sunriseTime = (currentSunrise["sunrise"]);
          print(sunriseTime.runtimeType);
          double sunriseTimeHours=(sunriseTime/3600).toDouble();
          // so we had computed the result in the hours
          int actualhours=(sunriseTimeHours.toInt())%24;
          int sunriseMinutes=(((sunriseTimeHours).toInt())%100)*60;
          print(actualhours);
          print(sunriseMinutes);
          sunrise="${actualhours}:${sunriseMinutes}";

          print("sunrise");
          print(sunrise);
          var sunsetTime = (currentSunrise["sunset"]);
          double sunsetTimeHours=(sunsetTime/3600).toDouble();
          int sunsetHours=(sunsetTimeHours.toInt())%24;
          int sunsetMinutes=(((sunsetTimeHours*100).toInt())%100)*60;
          print("sunset");
          sunset="${sunsetHours}:${sunsetMinutes}";
          print(sunset);

          Map mainDetails=data["main"];
          pressure = mainDetails["pressure"].toString();
          humidity = mainDetails["humidity"].toString();
          minTemp = mainDetails["temp_min"].toString();
          maxTemp = mainDetails["temp_max"].toString();

          print(pressure);
          print(minTemp);
          print(maxTemp);
          print(humidity);

          //todo error in the  data fetching of the visiblity
          // eror in the data of the visiblity
          // visiblity=data["visiblity"];
          // print("visiblity");
          // print(visiblity);

          print("going to print the temp details");
          Map wind=data["wind"];
          windSpeed = wind["speed"].toString();
          print(windSpeed);

          //todo error in the getting the data of the rain
          // Map raindetails=data["rain"];
          // rain=raindetails["1h"].toString();
          // print(rain);

          // // now we are going one level more inside
          List WeatherDescription = data["weather"];
          Map WeatherDescriptionMap = WeatherDescription[0];
          description = WeatherDescriptionMap["description"].toString();
          icon = WeatherDescriptionMap["icon"].toString();
          weather_info=WeatherDescriptionMap["main"].toString();
          print("description");
          print(icon);
          print(weather_info);
          //
          //
          //todo now it's time to wrap all the details inside a List of map. SO that they could be used easily by us
          WeatherReport.add({
            "location": '${location_value}',
            'sunrise': '${sunrise}',
            "sunset": '${sunset}',
            'pressure': '${pressure}',
            'humidity': '${humidity}',
            'rain': '${rain}',
            'visiblity': '${visiblity}',
            'windspeed': '${windSpeed}',
            'description': '${description}',
            'icon': '${icon}',
            'minTemp': '${minTemp}',
            'maxTemp': '${maxTemp}',
            'weather_info': '${weather_info}'
          });
        }
        else{
          print("failed to get the weather details");
        }
      }
      catch(e){
        print("error ${e}");
      }
    }
  }

  Future<List<Map<String,dynamic>>> getData(List<String>locations_data) async {

    // Make an HTTP request to get data
    locations=locations_data;
    await getWeatherReport();
    return WeatherReport;
  }
}


