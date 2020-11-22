import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:filepicker_windows/filepicker_windows.dart' as picker;

import 'view_csv_data.dart';
import 'package:csv/csv.dart';

class CsvGeneratorDemo extends StatefulWidget {
  @override
  _CsvGeneratorDemoState createState() => _CsvGeneratorDemoState();
}

class _CsvGeneratorDemoState extends State<CsvGeneratorDemo> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV generate and load'),
        backgroundColor: Colors.green,
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
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _generateCSVAndView(context) async {
    // the fileDialog function
    final fileDialog = picker.SaveFilePicker();
          fileDialog.hidePinnedPlaces = false;
          fileDialog.fileName = "names";
          fileDialog.defaultExtension = "csv";
          fileDialog.forceFileSystemItems = false;
          fileDialog.filterSpecification = {'CSV Files': '*.csv;'};
          fileDialog.title = 'Save us';
          var savefile = fileDialog.getFile();
          var saveFilePath = savefile.path;
          
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

    // create file
    final File file = File(saveFilePath);
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);
    //loads the view_csv_data page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LoadAndViewCsvPage(path: saveFilePath),
      ),
    );
  }
}
