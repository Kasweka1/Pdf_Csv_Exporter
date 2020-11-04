import 'package:flutter/material.dart';
import 'package:csv_reader/csv_reader.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CSV App",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.green,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveCsv();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void loadCSV() {
    loadAsset('assets/sales.csv').then((dynamic output) {
      csvRaw = output;
      print(csvRaw);
    });
  }
}


final pdf = pw.Document();

Future saveCsv() async {
  Directory documentDirectory = await getApplicationDocumentsDirectory();

  String documentPath = documentDirectory.path;

  File file = File("$documentPath/exported_document.csv");

  file.writeAsBytesSync(pdf.save());
}
