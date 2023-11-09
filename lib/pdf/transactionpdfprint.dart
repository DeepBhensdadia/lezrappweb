import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../model/invoice.dart';

import 'package:pdf/widgets.dart';
import '../model/customer.dart';
import '../model/supplier.dart';
import '../utils.dart';

class transactionpdfprint {
  static Future transactiongenerat(transactionInvoice invoice) async {
    DateTime date = DateTime.now();
    String dateformate = DateFormat('dd-MM-yyyy').format(date);
    final doc = pw.Document();
    doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      header: (context) {
        return  buildSupplierAddress(invoice.supplier);
      },
      build: (pw.Context context) => [
        buildInvoice(invoice),
      ],
    ));

    // doc.addPage(pw.MultiPage(
    //   pageFormat: PdfPageFormat.a4,
    //   build: (pw.Context context) => [
    //     buildInvoice(invoice),
    //   ],
    // ));

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  static pw.Widget buildHeader(transactionInvoice invoice) => pw.Column(
        children: [
          // SizedBox(height: 10),

        ],
      );

  static pw.Widget buildSupplierAddress(Supplier2 supplier) => pw.Column(
        children: [
          pw.Text(supplier.name,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(supplier.address,
              textAlign: pw.TextAlign.center,
              style:
                  pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
          pw.Text(supplier.type,
              textAlign: TextAlign.center,
              style:
                  pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Mobile: ${saveuser()?.mobileno}',
                    style: pw.TextStyle(fontSize: 10)),
                pw.Text(saveuser()?.company.companyWebsite,
                    style: pw.TextStyle(fontSize: 10)),
                pw.Text('Email:${saveuser()?.company.companyEmail}',
                    style: pw.TextStyle(fontSize: 10)),
              ]),
          pw.Divider(color: PdfColors.grey, thickness: 1, height: 5),
        ],
      );

  static pw.Widget buildInvoice(transactionInvoice invoice) {
    final headers = [
      'Sr No.',
      'Date',
      'Custtomer/Supplier',
      'Remarks',
      'User',
      "Credit",
      "Debit",
      'Balance'
    ];
    final data = invoice.items.map(
      (item) {
        return [
          item.srno_,
          item.Date,
          item.customer,
          item.remark,
          item.User,
          item.credit,
          item.debit,
          item.blance,
        ];
      },
    ).toList();

    return pw.Table.fromTextArray(
      cellStyle: pw.TextStyle(
        fontSize: 6,
      ),
      headers: headers,
      data: data,
      border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
      cellAlignment: pw.Alignment.center,
      headerStyle: pw.TextStyle(
        fontSize: 8,
        color: PdfColors.white,
        fontWeight: FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: PdfColor.fromInt(0xff294472),
      ),
      cellHeight: 15,

      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.center,
        4: pw.Alignment.center,
        5: pw.Alignment.center,
      },
    );
  }

  // static pw.Widget buildTotal(orderexpenseInvoice invoice) {
  //   final netTotal = invoice.items
  //       .map((item) {
  //
  //     return double.parse(item.amount);
  //   }) // Convert amount to numeric value
  //       .reduce((item1, item2) => item1 + item2);
  //
  //   return pw.Container(
  //     height: 0.7 * PdfPageFormat.cm,
  //     decoration: pw.BoxDecoration(
  //       border: pw.Border.all(color: PdfColors.black),
  //     ),
  //     alignment: pw.Alignment.centerRight,
  //     child: pw.Row(
  //       mainAxisAlignment: pw.MainAxisAlignment.end,
  //       children: [
  //         pw.Container(
  //           width: 118.5,
  //           child: pw.Text("",style: pw.TextStyle(fontSize:10 )),
  //           // decoration: pw.BoxDecoration(
  //           //   border: pw.Border.all(color: PdfColors.black),
  //           // ),
  //         ),
  //         pw.Container(
  //           padding: pw.EdgeInsets.symmetric(horizontal: 10),
  //           child: pw.Center(
  //             child: pw.Text(
  //               " Total : Rs ${netTotal.toStringAsFixed(2)}",style: pw.TextStyle(fontSize: 8), // Format netTotal as desired
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           // decoration: pw.BoxDecoration(
  //           //   border: pw.Border.all(color: PdfColors.black),
  //           // ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
