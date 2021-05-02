import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'InvoicePage.dart';

class InvoiceWidgets {
  static pw.Widget headerContent(Invoice invoice) =>
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.SizedBox(height: 5),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          supplierInfo(invoice.supplier),
          barCodes(invoice),
        ]),
        pw.SizedBox(height: 10),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              customerInfo(invoice.customer),
              customerInvoiceInfo(invoice.info)
            ]),
        pw.SizedBox(height: 30),
      ]);

  static pw.Widget supplierInfo(Supplier supplier) =>
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(supplier.name,
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 3),
        pw.Text(supplier.address,
            style:
                pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
        pw.SizedBox(height: 3),
        pw.Text(supplier.paymentInfo,
            style:
                pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
      ]);

  static pw.Widget customerInfo(Customer customer) =>
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(customer.name,
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 3),
        pw.Text(customer.address,
            style:
                pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
      ]);

  static pw.Widget barCodes(Invoice invoice) => pw.Container(
      // margin: pw.EdgeInsets.all(5),
      padding: pw.EdgeInsets.all(5),
      height: 60,
      width: 60,
      decoration: pw.BoxDecoration(
          color: PdfColors.grey100, borderRadius: pw.BorderRadius.circular(10)),
      child: pw.BarcodeWidget(

          /// frontend color
          backgroundColor: PdfColors.black,

          /// backend color
          color: PdfColors.white,
          barcode: pw.Barcode.qrCode(),
          data: invoice.info.number));

  static pw.Widget customerInvoiceInfo(InvoiceInfo invoiceInfo) {
    final paymentTerms =
        '${invoiceInfo.dueDate.difference(invoiceInfo.date).inDays} days';

    ///
    final titles = <String>[
      'Invoice Number : ',
      'Invoice Date : ',
      'Payment Terms : ',
      'Due Date : '
    ];

    ///
    final data = <String>[
      invoiceInfo.number,
      Utils.formatDate(invoiceInfo.date),
      paymentTerms,
      Utils.formatDate(invoiceInfo.dueDate)
    ];

    ///
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: List.generate(titles.length, (index) {
          final title = titles[index];
          final value = data[index];
          return cIIText(title, value);
        }));
  }

  static pw.Widget cIIText(String title, String value) => pw.Container(
      width: 200,
      child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(title, style: pw.TextStyle(fontSize: 12)),
            pw.Text(value, style: pw.TextStyle(fontSize: 12)),
          ]));

  static pw.Widget Titles(Invoice invoice) => pw.Container(
      margin: pw.EdgeInsets.all(10),
      child:
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text('Invoice', style: pw.TextStyle(fontSize: 30)),
        pw.SizedBox(height: 10),
        pw.Text(invoice.info.description)
      ]));

  static pw.Widget InvoiceTable(Invoice invoice) {
    final tableHeaders = [
      'Description',
      'Date',
      'Quantity',
      'Unit Price',
      'VAT',
      'Total'
    ];

    ///
    final tableData = invoice.items.map((item) {
      final total = item.unitPrice * item.quantity * (1 + item.VAT);
      return [
        item.description,
        Utils.formatDate(item.date),
        '${item.quantity}',
        '\$ ${item.unitPrice}',
        '${item.VAT} %',
        '\$ ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    ///
    return pw.Table.fromTextArray(
      headers: tableHeaders,
      data: tableData,
      border: null,
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerRight,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.centerRight,
        5: pw.Alignment.centerRight
      },
    );
  }

  static pw.Widget totalAmount(Invoice invoice) {
    final netTotal = invoice.items
        .map((item) => item.unitPrice * item.quantity)
        .reduce((item1, item2) => item1 + item2);
    final vatPercent = invoice.items.first.VAT;
    final Vat = netTotal * vatPercent;
    final total = netTotal + Vat;

    return pw.Container(
        margin: pw.EdgeInsets.all(10),
        alignment: pw.Alignment.centerRight,
        child: pw.Row(children: [
          pw.Spacer(flex: 5),
          pw.Expanded(
              flex: 5,
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    AmountTextWidgets(
                        title: 'Net Total',
                        value: Utils.formatPrice(netTotal),
                        unite: false),
                    AmountTextWidgets(
                        title: 'VAT ${vatPercent * 100} %',
                        value: Utils.formatPrice(Vat),
                        unite: false),
                    pw.Divider(height: 3, color: PdfColors.black),
                    pw.Divider(height: 3, color: PdfColors.black),
                    AmountTextWidgets(
                        title: 'Total Amount Due',
                        // titieStyle: TextStyle(
                        //     fontSize: 14, fontWeight: FontWeight.bold),
                        value: Utils.formatPrice(total),
                        unite: true,
                        decoration: true),
                    pw.SizedBox(height: 20)
                  ]))
        ]));
  }

  static AmountTextWidgets(
      {String title,
      String value,
      double width = double.infinity,
      TextStyle titieStyle,
      bool unite = false,
      bool decoration = false}) {
    final style = titieStyle ??
        pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 12);
    return pw.Container(
        width: width,
        child: pw.Row(children: [
          pw.Expanded(child: pw.Text(title, style: style)),
          pw.Text(value, style: unite ? null : style)
        ]),
        margin: decoration ? pw.EdgeInsets.symmetric(vertical: 5) : null,
        padding: decoration ? pw.EdgeInsets.all(5) : null,
        decoration:
            decoration ? pw.BoxDecoration(color: PdfColors.grey200) : null);
  }

  static pw.Widget footerContent(Invoice invoice) =>
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
        pw.Divider(height: 1),
        pw.SizedBox(height: 5),
        textWidgets(title: 'Address', value: invoice.supplier.address),
        textWidgets(title: 'Paypal', value: invoice.supplier.paymentInfo),
      ]);

  static pw.Widget textWidgets({String title, String value}) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text('${title} ',
              style:
                  pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          pw.Text('${value} ',
              style:
                  pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
        ],
      );
}
