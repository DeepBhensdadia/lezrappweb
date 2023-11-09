

import 'package:lezrapp/model/supplier.dart';

import '../mybusiness_screens/customer/customer_screen.dart';
import '../../../model/bank.dart';
import 'customer.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final C_calls customer;
  final List<InvoiceItem> items;
  final Bank details;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
    required this.details,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {

  final String srno_;
  final DateTime tra_date;
  final String particular;
  final  String credit;
  final  String debit;
  final  String totalblance;

  const InvoiceItem({
  required this.srno_,
  required this.tra_date,
  required this.particular,
  required this.credit,
  required this.debit,
  required this.totalblance,
});
}

class Invoice2 {
  // final InvoiceInfo2 info;
  final Supplier2 supplier;
  // final C_calls customer;
  final List<InvoiceItem2> items;
  // final Bank details;

  const Invoice2({
    // required this.info,
    required this.supplier,
    // required this.customer,
    required this.items,
    // required this.details,
  });
}

class InvoiceInfo2 {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo2({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem2 {

  final String srno_;
  final String Customername;
  final String mobileno;
  final String address;
  final String type;
  final String amount;

  const InvoiceItem2({
  required this.srno_,
  required this.Customername,
  required this.mobileno,
  required this.address,
  required this.type,
  required this.amount,
});
}
class orderexpenseInvoiceItem {

  final String srno_;
  final String Date;
  final String User;
  final String remark;
  final String type;
  final String amount;

  const orderexpenseInvoiceItem({
  required this.srno_,
  required this.Date,
  required this.User,
  required this.remark,
  required this.type,
  required this.amount,
});
}

class transactionInvoiceItem {

  final String srno_;
  final String Date;
  final String User;
  final String remark;
  final String customer;
  final String blance;
  final String credit;
  final String debit;

  const transactionInvoiceItem({
  required this.srno_,
  required this.Date,
  required this.User,
  required this.remark,
  required this.customer,
  required this.blance,
  required this.credit,
  required this.debit,
});
}



class orderexpenseInvoice {
  // final InvoiceInfo2 info;
  final Supplier2 supplier;
  // final C_calls customer;
  final List<orderexpenseInvoiceItem> items;
  // final Bank details;

  const orderexpenseInvoice({
    // required this.info,
    required this.supplier,
    // required this.customer,
    required this.items,
    // required this.details,
  });
}
class transactionInvoice {
  // final InvoiceInfo2 info;
  final Supplier2 supplier;
  // final C_calls customer;
  final List<transactionInvoiceItem> items;
  // final Bank details;

  const transactionInvoice({
    // required this.info,
    required this.supplier,
    // required this.customer,
    required this.items,
    // required this.details,
  });
}