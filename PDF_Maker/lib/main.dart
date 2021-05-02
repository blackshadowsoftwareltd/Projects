import 'package:flutter/material.dart';
import 'package:pdf_macker/DocumentTypePDF.dart';
import 'package:pdf_macker/ImagesPdf.dart';
import 'package:pdf_macker/Invoice/InvoicePage.dart';
import 'package:pdf_macker/SimplePdf.dart';
import 'package:pdf_macker/TablePdf.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('PDF Maker')),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 1),
                  OutlinedButton(
                    child: Text('Create a Simple PDF'),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SimplePDF())),
                  ),
                  OutlinedButton(
                    child: Text('Create a Document type PDF'),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DocumentTypePDF())),
                  ),
                  OutlinedButton(
                    child: Text('Create a Table PDF'),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TablePdf())),
                  ),
                  OutlinedButton(
                    child: Text('Create a Image PDF'),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ImagesPdf())),
                  ),
                  OutlinedButton(
                    child: Text('Create a Invoice PDF'),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InvoicePage())),
                  ),
                  Spacer(flex: 1)
                ])));
  }
}
