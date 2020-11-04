import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/exported_document.csv");

    file.writeAsBytesSync(pdf.save());
  }