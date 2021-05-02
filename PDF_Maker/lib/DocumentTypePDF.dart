import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_macker/Services.dart';

class DocumentTypePDF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Document Type PDF')),
      body: Center(
        child: OutlinedButton(
            child: Text(
              'Create',
            ),
            onPressed: () async {
              print('pressed');
              final pdfFile = await DocumentType.generate();
              Services.opentFile(pdfFile);
            }),
      ),
    );
  }
}

class DocumentType {
  static Future<File> generate() async {
    final pdf = pw.Document();

    /// MultiPage for Multiple pages
    pdf.addPage(pw.MultiPage(
        build: (context) => [
              /// Custom headLine
              CustomHeadLine(),

              /// header
              pw.Header(
                  child: pw.Text('Header', style: pw.TextStyle(fontSize: 25))),

              /// paragraph
              pw.Paragraph(
                  text: 'Paragraph', style: pw.TextStyle(fontSize: 18)),

              /// backLink
              BackLinked(),

              /// bullets
              ...BulletPoints(),

              /// third Custom headline
              ThirdCustomHeadLine(),
              ...DummyText()
            ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';
          return pw.Container(
              margin: pw.EdgeInsets.only(top: 10),
              alignment: pw.Alignment.centerRight,
              child: pw.Text(text));
        }));

    return Services.saveDocument(name: 'DocumentTypePdf.pdf', pdf: pdf);
  }

  static pw.Widget CustomHeadLine() => pw.Container(
      height: 50,
      margin: pw.EdgeInsets.all(5),
      padding: pw.EdgeInsets.all(5),
      decoration: pw.BoxDecoration(
          color: PdfColors.green,
          border: pw.Border.all(width: 3, color: PdfColors.black)),
      child: pw.Row(children: [
        pw.PdfLogo(),
        pw.SizedBox(width: .5 * PdfPageFormat.cm),
        pw.Text('Custom Head Line',
            style: pw.TextStyle(
                fontSize: 25,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.white))
      ]));

  static pw.Widget ThirdCustomHeadLine() => pw.Header(
      child: pw.Text('Third Custom HeadLine',
          style: pw.TextStyle(
              fontSize: 25,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white)),
      padding: pw.EdgeInsets.all(5),
      decoration: pw.BoxDecoration(
          color: PdfColors.orange, borderRadius: pw.BorderRadius.circular(10)));

  static pw.Widget BackLinked() => pw.UrlLink(
      child: pw.Text('Flutter Dev',
          style: pw.TextStyle(
              fontSize: 17,
              color: PdfColors.blue,
              decoration: pw.TextDecoration.underline)),
      destination: 'https://flutter.dev');

  static List<pw.Widget> BulletPoints() => [
        pw.Bullet(text: 'First Bullet', style: pw.TextStyle(fontSize: 18)),
        pw.Bullet(text: 'Second Bullet', style: pw.TextStyle(fontSize: 18)),
        pw.Bullet(text: 'Third Bullet', style: pw.TextStyle(fontSize: 18))
      ];

  static List<pw.Widget> DummyText() => [
        pw.Text(
            'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?',
            style: pw.TextStyle(fontSize: 16)),
        pw.Text(
            'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?',
            style: pw.TextStyle(fontSize: 16)),
        pw.Text(
            'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?',
            style: pw.TextStyle(fontSize: 16)),
        pw.Text(
            'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?',
            style: pw.TextStyle(fontSize: 16)),
        pw.Text(
            'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?',
            style: pw.TextStyle(fontSize: 16)),
        pw.Text(
            'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?',
            style: pw.TextStyle(fontSize: 16)),
      ];
}
