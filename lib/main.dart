// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/WidgetsAll/fetchingData.dart';
import 'package:weatherapp/pages/loading.dart';

// import 'package:weatherapp/pages/location.dart';
import './pages/Main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Main(
              weatherFetchedData: [],
            ),
        "/fetching": (context) => fetchingData(),
      },
    ),
  );
}
