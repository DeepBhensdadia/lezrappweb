import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../model/invoice.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:pdf/widgets.dart';
import '../model/customer.dart';
import '../model/supplier.dart';
import '../utils.dart';

class PdfInvoice {
  static Future generate(Invoice2 invoice) async {
    final font = pw.Font.ttf(
      await rootBundle.load('assets/fonts/noto-sans-regular.ttf'),
    );
    DateTime date = DateTime.now();
    String dateformate = DateFormat('dd-MM-yyyy').format(date);
    final doc = pw.Document();
    doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      maxPages: 1000,
      footer: (context) {
        return pw.Padding(
            padding: pw.EdgeInsets.only(top: 10),
            child:
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              pw.Text('Report generated with LezrApp',
                  style: pw.TextStyle(fontSize: 8, color: PdfColors.black)),
            ]));
      },
      build: (pw.Context context) => [
        buildSupplierAddress(context, invoice.supplier),
        buildInvoice(context, invoice,font),
        // pw.Stack(children: [
        //
        //   pw.Padding(
        //     padding: pw.EdgeInsets.fromLTRB(400, 30, 0, 300),
        //     child: pw.Text(dateformate,
        //         style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        //   ),
        // ])
        //       pw.Container(
        //         padding: pw.EdgeInsets.all(15),
        //         decoration: pw.BoxDecoration(
        //             border: pw.Border.all(color: PdfColors.black, width: 2)),
        //         child: pw.Column(
        //           children: [
        //
        //             pw.ListView.builder(itemBuilder: (context, index) => pw.Container(child: pw.Text(index.toString()),), itemCount: 100),
        //
        //
        //
        //
        //           ],
        //         ),
        //       ),
      ],
    ));

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  static pw.Widget buildHeader(pw.Context context, Invoice2 invoice) =>
      pw.Column(
        children: [
          // SizedBox(height: 10),
        ],
      );

  static pw.Widget buildSupplierAddress(
          pw.Context context, Supplier2 supplier) =>
      pw.Column(
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

  static pw.Widget buildInvoice(pw.Context context, Invoice2 invoice,font) {

    final headers = [
      'Sr No.',
      'Customer',
      'Mobile No',
      'Address',
      'Type',
      'Amount'
    ];
    final data = invoice.items.map(
      (item) {
        return [
          item.srno_,
          item.Customername,
          item.mobileno,
          item.address,
          item.type,
          item.amount,
        ];
      },
    ).toList();

    return pw.Table.fromTextArray(
      cellStyle: pw.TextStyle(
        fontSize: 6,
        font: font
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

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = pw.TextStyle(fontWeight: FontWeight.bold);

    return pw.Container(
        width: 250,
        child: pw.Row(
          children: [
            pw.Row(children: [
              pw.Text(title, style: style),
            ]),
            pw.SizedBox(width: 2 * PdfPageFormat.mm),
            pw.Row(children: [
              pw.Text(value),
            ]),
          ],
        ));
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    pw.TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? pw.TextStyle(fontWeight: FontWeight.bold);

    return pw.Container(
      width: width,
      child: pw.Row(
        children: [
          pw.Expanded(child: pw.Text(title, style: style)),
          pw.Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
