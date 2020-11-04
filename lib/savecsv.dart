import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;

Future pdf = pw.Document();

Future savePdf() async {
  Directory documentDirectory = await getApplicationDocumentsDirectory();

  String documentPath = documentDirectory.path;

  File file = File("$documentPath/exported_document.csv");

  file.writeAsBytesSync(pdf.save());
}
