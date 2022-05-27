import 'package:airport_finder/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'app/home/main_page_view.dart';
import 'app/map/map.dart';

void main() async {
  runApp(const MyApp());
 // var database = openDatabase(join(await getDatabasesPath(), '/Users/mhersimonyan/Desktop/Airport.db'));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      onGenerateRoute:  ApplicationRoute().generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}


