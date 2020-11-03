import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MyPdf extends StatelessWidget {
  final pdf = pw.Document;

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
              level: 0,
              child: pw.Text("Wind Energy"),
            ),
            pw.Paragraph(
                text:
                    "Wind Energy, energy contained in the force of the winds blowing across the earth's surface. When "
                    "harnessed, wind energy can be converted into mechanical energy for performing work such as pumping water,"
                    "grinding grain, and milling lumber. By connecting a spinning rotor (an assembly of blades attached to a hub) to "
                    "an electric generator, modern wind turbines convert wind energy, which turns the rotor, into electrical energy."),
            pw.Paragraph(
                text:
                    "Wind Energy, energy contained in the force of the winds blowing across the earth's surface. When "
                    "harnessed, wind energy can be converted into mechanical energy for performing work such as pumping water,"
                    "grinding grain, and milling lumber. By connecting a spinning rotor (an assembly of blades attached to a hub) to "
                    "an electric generator, modern wind turbines convert wind energy, which turns the rotor, into electrical energy."),
            pw.Header(level: 1, child: pw.Text("2nd Wind Enrgy")),
            pw.Paragraph(
                text:
                    "Wind Energy, energy contained in the force of the winds blowing across the earth's surface. When "
                    "harnessed, wind energy can be converted into mechanical energy for performing work such as pumping water,"
                    "grinding grain, and milling lumber. By connecting a spinning rotor (an assembly of blades attached to a hub) to "
                    "an electric generator, modern wind turbines convert wind energy, which turns the rotor, into electrical energy."),
            pw.Paragraph(
                text:
                    "Wind Energy, energy contained in the force of the winds blowing across the earth's surface. When "
                    "harnessed, wind energy can be converted into mechanical energy for performing work such as pumping water,"
                    "grinding grain, and milling lumber. By connecting a spinning rotor (an assembly of blades attached to a hub) to "
                    "an electric generator, modern wind turbines convert wind energy, which turns the rotor, into electrical energy."),
          ];
        }));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = file("$documentPath/exmaple.pdf");
    file.writeAsBytesSync(savePdf());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pdf Exporter"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "PDF Viewer",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  async{
          writeOnPdf();
          await savePdf();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
