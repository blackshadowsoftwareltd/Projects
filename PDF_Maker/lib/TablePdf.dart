import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

import 'Services.dart';

class TablePdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table PDF')),
      body: Center(
        child: OutlinedButton(
          child: Text('Create'),
          onPressed: () async {
            final pdfFile = await PdfTable.generateTable();
            Services.opentFile(pdfFile);
          },
        ),
      ),
    );
  }
}

class PdfTable {
  static Future<File> generateTable() async {
    final pdf = pw.Document();
    final headersText = ['Model Name', 'Price'];
    final models = [
      Model('OnePlus 7', 690),
      Model('OnePlus 8', 550),
      Model('OnePlus 9', 730),
    ];
    final datas =
        models.map((model) => [model.modelname, model.price]).toList();

    pdf.addPage(pw.Page(
        build: (context) =>
            pw.Table.fromTextArray(headers: headersText, data: datas)));

    return Services.saveDocument(name: 'TablePdf.pdf', pdf: pdf);
  }
}

class Model {
  final String modelname;
  final int price;

  Model(this.modelname, this.price);
}
