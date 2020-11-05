import 'package:flutter/material.dart';
import 'csv.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CSV App",
      home: CsvGeneratorDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
