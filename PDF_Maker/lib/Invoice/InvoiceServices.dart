// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'InvoicePage.dart';
//
// import 'package:pdf/widgets.dart' as pw;
//
// class InvoiceServices {
//   static Widget buildCustomerAddress(Customer customer) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
//           Text(customer.address),
//         ],
//       );
//
//   static Widget buildInvoiceInfo(InvoiceInfo info) {
//     final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
//     final titles = <String>[
//       'Invoice Number:',
//       'Invoice Date:',
//       'Payment Terms:',
//       'Due Date:'
//     ];
//     final data = <String>[
//       info.number,
//       Utils.formatDate(info.date),
//       paymentTerms,
//       Utils.formatDate(info.dueDate),
//     ];
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: List.generate(titles.length, (index) {
//         final title = titles[index];
//         final value = data[index];
//
//         return buildText(title: title, value: value, width: 200);
//       }),
//     );
//   }
//
//   static Widget buildSupplierAddress(Supplier supplier) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(supplier.name, style: TextStyle(fontWeight: FontWeight.bold)),
//           SizedBox(height: 1 * PdfPageFormat.mm),
//           Text(supplier.address),
//         ],
//       );
//
//   static Widget buildTitle(Invoice invoice) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'INVOICE',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 0.8 * PdfPageFormat.cm),
//           Text(invoice.info.description),
//           SizedBox(height: 0.8 * PdfPageFormat.cm),
//         ],
//       );
//
//
//
//   static Widget buildTotal(Invoice invoice) {
//     final netTotal = invoice.items
//         .map((item) => item.unitPrice * item.quantity)
//         .reduce((item1, item2) => item1 + item2);
//     final vatPercent = invoice.items.first.VAT;
//     final vat = netTotal * vatPercent;
//     final total = netTotal + vat;
//
//     return Container(
//       alignment: Alignment.centerRight,
//       child: Row(
//         children: [
//           Spacer(flex: 6),
//           Expanded(
//             flex: 4,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 buildText(
//                   title: 'Net total',
//                   value: Utils.formatPrice(netTotal),
//                   unite: true,
//                 ),
//                 buildText(
//                   title: 'Vat ${vatPercent * 100} %',
//                   value: Utils.formatPrice(vat),
//                   unite: true,
//                 ),
//                 Divider(),
//                 buildText(
//                   title: 'Total amount due',
//                   titleStyle: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   value: Utils.formatPrice(total),
//                   unite: true,
//                 ),
//                 // SizedBox(height: 2 * PdfPageFormat.mm),
//                 // Container(height: 1, color: PdfColors.grey400),
//                 // SizedBox(height: 0.5 * PdfPageFormat.mm),
//                 // Container(height: 1, color: PdfColors.grey400),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   static Widget buildFooter(Invoice invoice) => Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Divider(),
//           SizedBox(height: 2 * PdfPageFormat.mm),
//           buildSimpleText(title: 'Address', value: invoice.supplier.address),
//           SizedBox(height: 1 * PdfPageFormat.mm),
//           buildSimpleText(title: 'Paypal', value: invoice.supplier.paymentInfo),
//         ],
//       );
//
//   static buildSimpleText({
//     String title,
//     String value,
//   }) {
//     final style = TextStyle(fontWeight: FontWeight.bold);
//
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment:CrossAxisAlignment.end,
//       children: [
//         Text(title, style: style),
//         SizedBox(width: 2 * PdfPageFormat.mm),
//         Text(value),
//       ],
//     );
//   }
//
//   static buildText({
// String title,
// String value,
//     double width = double.infinity,
//     TextStyle titleStyle,
//     bool unite = false,
//   }) {
//     final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);
//
//     return Container(
//       width: width,
//       child: Row(
//         children: [
//           Expanded(child: Text(title, style: style)),
//           Text(value, style: unite ? style : null),
//         ],
//       ),
//     );
//   }
// }
