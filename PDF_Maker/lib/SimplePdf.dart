import 'dart:io';
import 'package:flutter/material.dart';

/// as pw. that's means pdf/widgets is not flutter material widgets. so it will be conflict. so mush use as pw
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_macker/Services.dart';

class SimplePDF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Simple PDF')),
        body: Center(
          child: OutlinedButton(
              child: Text(
                'Create',
              ),
              onPressed: () async {
                print('pressed');
                final pdfFile =
                    await PdfService.generateSimpleTextPdf('Simple PDF');
                Services.opentFile(pdfFile);
              }),
        ));
  }
}

/// every widgets is pdf widgets so we have to use >>> pw.Widgets
class PdfService {
  static Future<File> generateSimpleTextPdf(String text) async {
    print('creating');
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        build: (context) => pw.Center(
            child: pw.Text('Simple Text PDF',
                style: pw.TextStyle(fontSize: 30)))));
    return Services.saveDocument(name: 'simplePDF.pdf', pdf: pdf);
  }
}
