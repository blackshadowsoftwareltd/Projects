import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'Services.dart';

class ImagesPdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Images PDF')),
      body: Center(
        child: OutlinedButton(
          child: Text('Create'),
          onPressed: () async {
            print('pressed');
            final pdfFile = await ImagePDF.generateImagePDF();

            Services.opentFile(pdfFile);
          },
        ),
      ),
    );
  }
}

class ImagePDF {
  static Future<File> generateImagePDF() async {
    final pdf = pw.Document();

    /// jpeg or png format image must will be asUnit8List()
    final imgPng =
        (await rootBundle.load('assets/ser.png')).buffer.asUint8List();

    /// making a background images
    final BackGroundTheme = pw.PageTheme(
        pageFormat: PdfPageFormat.a4,
        buildBackground: (context) =>

            /// using a condition. if page number is 1? background will be show an image
            context.pageNumber == 1
                ? pw.FullPage(
                    ignoreMargins: true,
                    child:
                        pw.Image(pw.MemoryImage(imgPng), fit: pw.BoxFit.cover))
                : pw.Container());

    /// All Widgets are support in pdf
    pdf.addPage(pw.MultiPage(
        pageTheme: BackGroundTheme,
        build: (context) => [
              pw.Container(
                  height: 250,
                  color: PdfColors.green,
                  margin: pw.EdgeInsets.all(10),
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Image(pw.MemoryImage(imgPng))),
              pw.Container(
                  height: 250,
                  color: PdfColors.green,
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Image(pw.MemoryImage(imgPng))),
              pw.Container(
                  height: 250,
                  color: PdfColors.green,
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Image(pw.MemoryImage(imgPng))),
              pw.Container(
                  height: 250,
                  color: PdfColors.green,
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Image(pw.MemoryImage(imgPng))),
              pw.Container(
                  height: 250,
                  color: PdfColors.green,
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Image(pw.MemoryImage(imgPng))),
            ]));
    return Services.saveDocument(name: 'ImagesPdf.pdf', pdf: pdf);
  }
}
