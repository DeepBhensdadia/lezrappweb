import 'dart:io';
import 'package:intl/intl.dart';
import 'package:lezrapp/api/const_apis.dart';
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
import 'package:flutter/services.dart' show rootBundle;

class PdfInvoiceApi {
  static Future<void> filesharegenerate(
      Invoice invoice, String netTotal) async {
    final font = pw.Font.ttf(
      await rootBundle.load('assets/fonts/noto-sans-regular.ttf'),
    );
    DateTime date = DateTime.now();
    String dateformat = DateFormat('dd-MM-yyyy').format(date);
    final doc = pw.Document();
    doc.addPage(
      pw.MultiPage(
        maxPages: 1000,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => [
          buildHeader(invoice, netTotal,font),
          buildInvoice(invoice, font),
          buildTotal(invoice, netTotal, font),
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
    final font = pw.Font.ttf(
      await rootBundle.load('assets/fonts/noto-sans-regular.ttf'),
    );
    final doc = pw.Document();
    doc.addPage(pw.MultiPage(
      maxPages: 100,
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => [
        buildHeader(invoice, netTotal,font),
        // buildTitle(invoice),
        buildInvoice(invoice, font),
        buildTotal(invoice, netTotal, font),
        pw.Padding(
            padding: pw.EdgeInsets.only(top: 10),
            child: pw.Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              pw.Text('Report generated with LezrApp'),
            ]))
      ],
      // [
      // pw.Container(
      //   decoration: pw.BoxDecoration(
      //       border: pw.Border.all(color: PdfColors.black, width: 2)),
      //   child: pw.Container(
      //     margin: pw.EdgeInsets.all(10),
      //     child: pw.Column(children: []),
      //   ),
      // ),
      // ],
    ));

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  static Widget buildHeader(Invoice invoice, String netTotal,font) => pw.Column(
        children: [
          pw.SizedBox(height: 20),
          buildSupplierAddress(invoice.supplier),
          pw.Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer as C_calls),
              buildInvoiceInfo(invoice, netTotal,font),
            ],
          ),
        ],
      );

  static Widget buildCustomerAddress(C_calls customer) => pw.SizedBox(
          child: pw.Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            pw.Text('Customer Name:',
                style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 8)),
            pw.SizedBox(
              width: 6 * PdfPageFormat.cm,
              child: pw.Text(customer.name, style: pw.TextStyle(fontSize: 8)),
            )
          ]),
          pw.Row(children: [
            pw.Text('Mobile:',
                style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 8)),
            pw.Text(customer.mobail, style: pw.TextStyle(fontSize: 8)),
          ]),
          pw.Row(children: [
            pw.SizedBox(height: 15),
          ]),
        ],
      ));

  static Widget buildInvoiceInfo(Invoice invoice, String netTotal,font) {
    final Totaldebit = invoice.items.map((item) {
      return double.tryParse(
              item.debit.replaceAll("${saveuser()?.company.currency}", "")) ??
          0;
    }).reduce((item1, item2) => item1 + item2);
    final Totalcredit = invoice.items.map((item) {
      return double.tryParse(
              item.credit.replaceAll("${saveuser()?.company.currency}", "")) ??
          0;
    }).reduce((item1, item2) => item1 + item2);

    final paymentTerms =
        '${invoice.info.dueDate.difference(invoice.info.date).inDays}';
    final titles = <String>[
      'Total Credit:',
      'Total Payment:',
      'Balance:',
    ];
    final data = <String>[
      getformettedamount(text: "$Totaldebit"),
      getformettedamount(text: "$Totalcredit"),
      getformettedamount(text: "$netTotal Due"),
    ];
    return pw.Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        titles.length,
        (index) {
          final title = titles[index];
          final value = data[index];

          return buildText(title: title, value: value, width: 200,font: font);
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
            pw.Text('Mobile: ${saveuser()?.company.companyMobileNo}',
                style: pw.TextStyle(fontSize: 8)),
            pw.Text(saveuser()?.company.companyWebsite,
                style: pw.TextStyle(fontSize: 8)),
            pw.Text('Email:${saveuser()?.company.companyEmail}',
                style: pw.TextStyle(fontSize: 8)),
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

  static Widget buildInvoice(Invoice invoice, font) {
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
          getformettedamount(text: "${item.credit}"),
          getformettedamount(text: "${item.debit}"),
          getformettedamount(text: "${item.totalblance}"),
        ];
      },
    ).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: pw.TableBorder.all(color: PdfColors.black),
      cellAlignment: Alignment.center,
      headerStyle: pw.TextStyle(
        font: font,
        fontSize: 8,
        color: PdfColors.white,
        fontWeight: FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: PdfColor.fromInt(0xff294472),
      ),
      cellHeight: 15,
      cellStyle: pw.TextStyle(
        fontSize: 8,
        font: font,
      ),
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

  static Widget buildTotal(Invoice invoice, netTotal, font) {
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
                child: pw.Text(getformettedamount(text: "${netTotal} Due "),
                    style: pw.TextStyle(
                      fontSize: 10,
                      font: font,
                    ),
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
    font,
    bool unite = false,
  }) {
    final style =
        titleStyle ?? pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 8);

    return pw.Container(
      width: width,
      child: pw.Row(
        children: [
          pw.Expanded(child: pw.Text(title, style: style)),
          pw.Text(value, style: unite ? style : pw.TextStyle(fontSize: 8,font: font)),
        ],
      ),
    );
  }
}
