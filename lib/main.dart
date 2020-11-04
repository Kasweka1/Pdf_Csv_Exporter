import 'package:flutter/material.dart';
import 'package:csv_reader/csv_reader.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CSV App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String csvRaw;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Click Me"),
            onPressed: () {
              loadCSV();
            },
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void loadCSV() {
    loadAsset('assets/SalaahTimes.csv').then((dynamic output) {
      csvRaw = output;
      print(csvRaw);
    });
  }
}
