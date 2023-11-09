import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:lezrapp/api/pdf_api.dart';
import 'package:lezrapp/helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import '../model/customer.dart';
import '../model/invoice.dart';
import '../model/supplier.dart';
import '../utils.dart';

class PdfInvoiceApi {
  static Future<void> filesharegenerate(
      Invoice invoice, String netTotal) async {
    DateTime date = DateTime.now();
    String dateformat = DateFormat('dd-MM-yyyy').format(date);
    final doc = pw.Document();

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => [
          Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black, width: 2),
            ),
            child: Container(
              margin: pw.EdgeInsets.all(10),
              child: Column(
                children: [
                  buildHeader(invoice, netTotal),
                  buildInvoice(invoice),
                  buildTotal(invoice, netTotal),
                  Padding(
                    padding: pw.EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text('Report generated with LezrApp'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final bytes = await doc.save();

    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/Statement.pdf';
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    await Share.shareFiles([filePath]);
  }

  static Future generate(Invoice invoice, String netTotal) async {
    DateTime date = DateTime.now();
    String dateformate = DateFormat('dd-MM-yyyy').format(date);
    final doc = pw.Document();
    doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => [
        pw.Container(
          decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black, width: 2)),
          child: pw.Container(
            margin: pw.EdgeInsets.all(10),
            child: pw.Column(children: [
              buildHeader(invoice, netTotal),
              // buildTitle(invoice),
              buildInvoice(invoice),
              buildTotal(invoice, netTotal),
              pw.Padding(
                  padding: pw.EdgeInsets.only(top: 10),
                  child: pw.Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        pw.Text('Report generated with LezrApp'),
                      ]))
            ]),
          ),
        ),
      ],
    ));

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  static Widget buildHeader(Invoice invoice, String netTotal) => pw.Column(
        children: [
          pw.SizedBox(height: 20),
          buildSupplierAddress(invoice.supplier),
          pw.Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer as C_calls),
              buildInvoiceInfo(invoice, netTotal),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(C_calls customer) => pw.SizedBox(
          child: pw.Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            pw.Text('Customer Name:',
                style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 8)),
            pw.SizedBox(
              width: 6 * PdfPageFormat.cm,
              child: pw.Text(customer.name, style: pw.TextStyle(fontSize: 8)),
            )
          ]),
          pw.Row(children: [
            pw.Text('Mobile:',
                style: pw.TextStyle(fontWeight: FontWeight.bold,fontSize: 8)),
            pw.Text(customer.mobail, style: pw.TextStyle(fontSize: 8)),
          ]),
          pw.Row(children: [
            pw.SizedBox(height: 15),
          ]),
        ],
      ));

  static Widget buildInvoiceInfo(Invoice invoice, String netTotal) {
    final Totaldebit = invoice.items.map((item) {
      return double.tryParse(item.debit.replaceAll("Rs.", "")) ?? 0;
    }).reduce((item1, item2) => item1 + item2);
    final Totalcredit = invoice.items.map((item) {
      return double.tryParse(item.credit.replaceAll("Rs.", "")) ?? 0;
    }).reduce((item1, item2) => item1 + item2);

    final paymentTerms =
        '${invoice.info.dueDate.difference(invoice.info.date).inDays}';
    final titles = <String>[
      'Total Credit:',
      'Total Payment:',
      'Balance:',
    ];
    final data = <String>[
      "Rs.$Totaldebit",
      "Rs.$Totalcredit",
      "Rs.$netTotal Due",
    ];
    return pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        titles.length,
        (index) {
          final title = titles[index];
          final value = data[index];

          return buildText(title: title, value: value, width: 200);
        },
      ),
    );
  }

  static Widget buildSupplierAddress(Supplier supplier) => pw.Column(
        children: [
          pw.Text(supplier.name,
              style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(supplier.address,
              textAlign: TextAlign.center,
              style: pw.TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          pw.SizedBox(height: 40),
          pw.Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            pw.Text('Mobile: ${saveuser()?.company.companyMobileNo}',style: pw.TextStyle(fontSize: 8)),
            pw.Text(saveuser()?.company.companyWebsite,style: pw.TextStyle(fontSize: 8)),
            pw.Text('Email:${saveuser()?.company.companyEmail}',style: pw.TextStyle(fontSize: 8)),
          ]),
          pw.Divider(color: PdfColors.grey, thickness: 1, height: 10),
        ],
      );

  // static Widget buildTitle(Invoice invoice) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'INVOICE',
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(height: 0.8 * PdfPageFormat.cm),
  //         Text(invoice.info.description),
  //         SizedBox(height: 0.8 * PdfPageFormat.cm),
  //       ],
  //     );

  static Widget buildInvoice(Invoice invoice) {
    final headers = [
      'Sr No.',
      'Date',
      'Particular',
      'Credit',
      'Debit',
      'Balance'
    ];
    final data = invoice.items.map(
      (item) {
        return [
          item.srno_,
          Utils.formatDate(item.tra_date),
          item.particular,
          item.credit,
          item.debit,
          "Rs.${item.totalblance}",
        ];
      },
    ).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: pw.TableBorder.all(color: PdfColors.black),
      cellAlignment: Alignment.center,
      headerStyle: pw.TextStyle(
        fontSize: 8,
        color: PdfColors.white,
        fontWeight: FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: PdfColor.fromInt(0xff294472),
      ),
      cellHeight: 15,
      cellStyle: pw.TextStyle(fontSize: 8),
      cellAlignments: {
        0: Alignment.center,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
        5: Alignment.center,
      },
    );
  }

  static Widget buildTotal(Invoice invoice, netTotal) {
    return pw.Column(children: [
      pw.Container(
        height: 1.5 * PdfPageFormat.cm,
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.black),
        ),
        alignment: Alignment.centerRight,
        child: pw.Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            pw.Spacer(flex: 6),
            pw.Container(
              padding: pw.EdgeInsets.all(15),
              child: pw.Text("Balance Due", style: pw.TextStyle(fontSize: 10)),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
            ),
            pw.Container(
              width: 129.5,
              child: pw.Center(
                child: pw.Text("Rs:${netTotal} Due ",
                    style: pw.TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
              ),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
            ),
          ],
        ),
      ),
      pw.Container(
        decoration:
            pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
        child: pw.Padding(
            padding: pw.EdgeInsets.only(left: 10),
            child: pw.Row(children: [
              pw.Column(
                children: [
                  buildSimpleText(
                      title: 'Our Banker', value: invoice.details.bank_name),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  buildSimpleText(
                      title: 'Account Number',
                      value: invoice.details.AC_number),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  buildSimpleText(
                      title: 'IFSC Code', value: invoice.details.ifsc_code),
                ],
              ),
            ])),
      )
    ]);
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
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? pw.TextStyle(fontWeight: FontWeight.bold,fontSize: 8);

    return pw.Container(
      width: width,
      child: pw.Row(
        children: [
          pw.Expanded(child: pw.Text(title, style: style)),
          pw.Text(value, style: unite ? style : pw.TextStyle(fontSize: 8) ),
        ],
      ),
    );
  }
}
