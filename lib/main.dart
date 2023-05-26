import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


import 'model/model_data.dart';
import 'model/model_user.dart';
import 'screens/read_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // 1-location of data base
  Directory directory =await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path+"/hive_data");
  /// register

  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(UserAdapter());
 // 2- create database
 await Hive.openBox<Map<String , String>>("data_box1");
 await Hive.openBox<Data>("notes_data");






  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: ReadScreen()),
    );
  }
}
