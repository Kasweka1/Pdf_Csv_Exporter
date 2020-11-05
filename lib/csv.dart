import 'dart:io';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import 'view_csv_data.dart';
import 'package:csv/csv.dart';

class CsvGeneratorDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV generate and load'),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Press the save button to load and csv document",
            style: TextStyle(fontSize: 38),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _generateCSVAndView(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }

// the function that generates a csv document from a String and saves it ti documents directory
  Future<void> _generateCSVAndView(context) async {
    //the list<list> which is converted to a csv
    List<List<String>> csvData = [
      // headers
      <String>['Name', 'Surname', 'School', 'DOB'],
      // data
      //1st Row
      <String>['Kasweka', 'Mukoko', 'RPS', '12 July 2002'],
      //2nd Row
      <String>['James', 'Banda', 'RPS', '06 Febuary 2002'],
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/baseball_teams.csv';

    // create file
    final File file = File(path);
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);
    //loads the view_csv_data page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LoadAndViewCsvPage(path: path),
      ),
    );
  }
}
