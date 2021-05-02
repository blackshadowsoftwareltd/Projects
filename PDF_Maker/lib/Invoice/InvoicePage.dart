import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_macker/Invoice/InvoiceWidgets.dart';
import '../Services.dart';

class InvoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Invoice Page')),
        body: Center(
            child: OutlinedButton(
                child: Text('Create a Invoice PDF'),
                onPressed: () async {
                  final date = DateTime.now();
                  final dueDate = date.add(Duration(days: 7));

                  final invoice = Invoice(
                    supplier: Supplier(
                      'Sarah Field',
                      'Sarah Street 9, Beijing, China',
                      'https://paypal.me/sarahfieldzz',
                    ),
                    customer: Customer(
                      'Apple Inc.',
                      'Apple Street, Cupertino, CA 95014',
                    ),
                    info: InvoiceInfo(
                      date,
                      dueDate,
                      'My description...',
                      '${DateTime.now().year}-9999',
                    ),
                    items: [
                      InvoiceItem(
                        'Coffee',
                        DateTime.now(),
                        3,
                        0.19,
                        5.99,
                      ),
                      InvoiceItem(
                        'Water',
                        DateTime.now(),
                        8,
                        0.19,
                        0.99,
                      ),
                      InvoiceItem(
                        'Orange',
                        DateTime.now(),
                        3,
                        0.19,
                        2.99,
                      ),
                      InvoiceItem(
                        'Apple',
                        DateTime.now(),
                        8,
                        0.19,
                        3.99,
                      ),
                      InvoiceItem(
                        'Mango',
                        DateTime.now(),
                        1,
                        0.19,
                        1.59,
                      ),
                      InvoiceItem(
                        'Blue Berries',
                        DateTime.now(),
                        5,
                        0.19,
                        0.99,
                      ),
                      InvoiceItem(
                        'Lemon',
                        DateTime.now(),
                        4,
                        0.19,
                        1.29,
                      ),
                    ],
                  );

                  ///
                  final pdfFile = await PdfInvoice.generateInvoice(invoice);
                  Services.opentFile(pdfFile);
                })));
  }
}

class PdfInvoice {
  static Future<File> generateInvoice(Invoice invoice) async {
    final pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
      build: (context) => [
        InvoiceWidgets.headerContent(invoice),
        InvoiceWidgets.Titles(invoice),
        InvoiceWidgets.InvoiceTable(invoice),
        pw.Divider(height: 2, color: PdfColors.black),
        InvoiceWidgets.totalAmount(invoice),
      ],
      footer: (context) => InvoiceWidgets.footerContent(invoice),
    ));

    ///
    return Services.saveDocument(name: 'InvoicePDF.pdf', pdf: pdf);
  }
}

class Invoice {
  @required
  final InvoiceInfo info;
  @required
  final Supplier supplier;
  @required
  final Customer customer;
  @required
  final List<InvoiceItem> items;

  const Invoice({
    this.info,
    this.supplier,
    this.customer,
    this.items,
  });
}

class Supplier {
  final String name;
  final String address;
  final String paymentInfo;

  Supplier(this.name, this.address, this.paymentInfo);
}

class InvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double VAT;
  final double unitPrice;

  InvoiceItem(
      this.description, this.date, this.quantity, this.VAT, this.unitPrice);
}

class Customer {
  final String name;
  final String address;

  Customer(this.name, this.address);
}

class InvoiceInfo {
  final DateTime date;
  final DateTime dueDate;
  final String description;
  final String number;

  InvoiceInfo(this.date, this.dueDate, this.description, this.number);
}

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';

  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
