import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

void saveAndOpenPdf(Uint8List pdfBytes) async {
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/summary.pdf');
  await file.writeAsBytes(pdfBytes, flush: true);

  // Open the PDF file
  OpenFile.open(file.path);
}
