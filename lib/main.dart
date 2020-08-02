import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/contollers/rooms_controller.dart';
import 'package:smart_home/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Rooms(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
