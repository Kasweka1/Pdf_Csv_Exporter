import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:async';
import 'package:filepicker_windows/filepicker_windows.dart' as picker;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PDF App",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File path;

  @override
  void initState() {
    super.initState();
  }

  final pdf = pw.Document();

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(level: 0, child: pw.Text("PDF flutter Export")),
          pw.Paragraph(
              text:
                  "This is an exprted flutter pdf file in the documents directory. By Kasweka"),
          pw.Paragraph(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
          pw.Header(level: 1, child: pw.Text("Second Heading")),
          pw.Paragraph(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
          pw.Paragraph(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
          pw.Paragraph(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
        ];
      },
    ));
  } // this function creates the pdf
// this function saves the pdf created above
  Future savePdf() async {
    final fileDialog = picker.SaveFilePicker();
    fileDialog.hidePinnedPlaces = false;
    fileDialog.fileName = "Exported Document";
    fileDialog.defaultExtension = "pdf";
    fileDialog.forceFileSystemItems = false;
    fileDialog.filterSpecification = {'PDF Files': '*.pdf;'};
    fileDialog.title = 'Select were to Save pdf';
    var savefile = fileDialog.getFile();
    var saveFilePath = savefile.path;
    File file = File(saveFilePath);
    file.writeAsBytesSync(pdf.save());
  }
// this function saves the pdf from the created file object
  Future pdfSaver() async {
    final fileDialog = picker.SaveFilePicker();
    fileDialog.hidePinnedPlaces = false;
    fileDialog.fileName = "Exported Document";
    fileDialog.defaultExtension = "pdf";
    fileDialog.forceFileSystemItems = false;
    fileDialog.filterSpecification = {'PDF Files': '*.pdf;'};
    fileDialog.title = 'Select were to Save pdf';
    var savefile = fileDialog.getFile();
    var saveFilePath = savefile.path;
    File file = new File(saveFilePath);
    file.writeAsString("file");
  }
//this function saves it to the documents directory directly

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Flutter"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Save Pdf on Floating ActionButton",
              style: TextStyle(fontSize: 34),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // this called function is for the created pdf from the pdf package
          savePdf();
          // this called function is for the created pdf from file object
          pdfSaver();
        },
        child: Icon(Icons.save),
      ),
      
    );
  }
}
