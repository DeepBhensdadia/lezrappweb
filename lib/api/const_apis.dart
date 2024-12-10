import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_model/addcompanymodel.dart';
import '../api_model/addstaffmoedel.dart';
import '../api_model/createcompanyprofilemodel.dart';
import '../api_model/customeradvance.dart';
import '../api_model/customeroutstanding.dart';
import '../api_model/customers/add_customer.dart';
import '../api_model/customers/get_customer_info.dart';
import '../api_model/customers/get_customers_api.dart';
import '../api_model/deletestaffmodel.dart';
import '../api_model/editprofilemodel.dart';
import '../api_model/expense/deletexpense.dart';
import '../api_model/expense/expense_api.dart';
import '../api_model/expense/expenseaddmodel.dart';
import '../api_model/expense/get_expense_api.dart';
import '../api_model/get_alltutorials.dart';
import '../api_model/get_summary.dart';
import '../api_model/getallcomapnys.dart';
import '../api_model/getallexpensesbackup.dart';
import '../api_model/getalltransactionbackup.dart';
import '../api_model/getcomapnystaff.dart';
import '../api_model/getmycurrentppackages.dart';
import '../api_model/login/companylogin_sendotpmodel.dart';
import '../api_model/login/sendotp.dart';
import '../api_model/login/saveusermodel.dart';
import '../api_model/login/staff_login_model.dart';
import '../api_model/login/verifyotp.dart';
import '../api_model/prebuypackagemodel/prepackagemodel.dart';
import '../api_model/rank_api/rank_list.dart';
import '../api_model/report/reminder.dart';
import '../api_model/report/top_customers.dart';
import '../api_model/resendotpmodel.dart';
import '../api_model/salseandpurchasemodel.dart';
import '../api_model/setting_api/get_all_subscriptions.dart';
import '../api_model/smschangedsetting.dart';
import '../api_model/smsremidermodel.dart';
import '../api_model/todaystransaction.dart';
import '../api_model/totalcreditreport.dart';
import '../api_model/transaction/add_transaction.dart';
import '../api_model/transaction/delet.dart';
import '../api_model/transaction/get_transaction.dart';
import '../api_model/transaction/transaction_detail_api.dart';
import '../api_model/type_model.dart';
import '../api_model/updatestaffmodel.dart';
import '../api_model/uploadimagemodel.dart';
import '../api_model/whatsappremidersend.dart';
import '../model/changecurrencyresponse.dart';
import '../mybusiness_screens/analytics/chartmodel/newcustomermodel.dart';
import '../mybusiness_screens/analytics/chartmodel/purchase_paymentofsupplierModel.dart';
import '../mybusiness_screens/analytics/chartmodel/sales_payment_customer.dart';
import '../mybusiness_screens/analytics/chartmodel/salesbynewandold.dart';
import '../mybusiness_screens/analytics/chartmodel/salsepurchaseexpensemodel.dart';
import '../sharedpref.dart';

final String mainurl = "https://web.lezrapp.com/lezr/services";
final String courl = "https://web.lezrapp.com/lezr/services/api";
final String customerurl = "https://web.lezrapp.com/lezr/services/customer";
final String expenseurl = "https://web.lezrapp.com/lezr/services/expense";
final headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  // 'Cookie': 'ci_session=8s2snk8594fdlgn7dpnvlahs1lnv7m9t'
};

String getformettedamount({required String text}) {
  return "${text != "" ? saveuser()?.company.currency : ""} $text";
}

SLogin? saveuser() {
  SLogin? saveuser = SharedPref.get(prefKey: PrefKey.saveuser) != null
      ? sLoginFromJson(SharedPref.get(prefKey: PrefKey.saveuser)!)
      : null;
  return saveuser;
}

bool kweb() {
  if (kIsWeb) {
    return true;
  }
  return false;
}

// Get Apis

Future<GetSummary> get_summary() async {
  var url = Uri.parse(
      '$courl/getSummary?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&device_token=');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getSummaryFromJson(response.body);
}

Future<Getallcompanystaff> get_all_userapi() async {
  var url = Uri.parse(
      '$mainurl/usertransaction/get_all_users?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&device_token=');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getallcompanystaffFromJson(response.body);
}

Future<Allexpense> get_expense(para) async {
  var url = Uri.parse(
      '$mainurl/expense/get_all_expense?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}$para');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return allexpenseFromJson(response.body);
}

Future<Customeroutstanding> customeroutstanding(id) async {
  var url = Uri.parse(
      '$mainurl/report/balanceCrList?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_type_id=$id');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return customeroutstandingFromJson(response.body);
}

Future<Slaseandpurchasemodelclass> salsepurchase(year) async {
  var url = Uri.parse(
      '$mainurl/rank/getTransactionStatement?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&year=$year');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return slaseandpurchasemodelclassFromJson(response.body);
}

Future<Customeradvance> customeradv(id) async {
  var url = Uri.parse(
      '$mainurl/report/balanceDrList?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_type_id=$id');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return customeradvanceFromJson(response.body);
}

Future<Totalcreditreport> Totalcredit(id, trid) async {
  var url = Uri.parse(
      '$mainurl/report/totalCrDrReports?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_type_id=$id&transaction_type=$trid');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return totalcreditreportFromJson(response.body);
}

Future<Totalcreditreport> Totalcreditall(trid) async {
  var url = Uri.parse(
      '$mainurl/report/totalCrDrReports?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&transaction_type=$trid');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return totalcreditreportFromJson(response.body);
}

Future<GetReminder> get_reminder(id) async {
  var url = Uri.parse(
      '$mainurl/report/reminderReports?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_type_id=$id');
  var response = await http.get(url);
  return getReminderFromJson(response.body);
}

Future top_customers(id) async {
  var url = Uri.parse(
      '$mainurl/report/topCustomerReport?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_type_id=$id');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return topCustomersFromJson(response.body);
}

Future<Todaystransaction> todaystranall() async {
  var url = Uri.parse(
      '$mainurl/report/todaysTransactions?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return todaystransactionFromJson(response.body);
}

Future<Todaystransaction> todaystransaction(id) async {
  var url = Uri.parse(
      '$mainurl/report/todaysTransactions?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_type_id=$id');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return todaystransactionFromJson(response.body);
}

get_tutorials() async {
  var url = Uri.parse(
      '$courl/getAllTutorials?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&transaction_id=14193');
  var response = await http.get(url);
  // print('Response body: ${response.body}');
  return getAlltutorialsFromJson(response.body);
}

Future get_products() async {
  var url = Uri.parse('$courl/businessTypes');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return categaryFromJson(response.body);
}

get_vesion() async {
  var url = Uri.parse('$courl/lezr_app_vesion');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return lezrappVesionFromJson(response.body);
}

Future<AllCustomer> get_allcustomer(customertypeid, text, offset) async {
  var url = Uri.parse(
      '$customerurl/get_all_customers?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_type_id=$customertypeid&search=$text&offset=$offset');
  var response = await http.get(url);
  // print('Response body: ${response.body}');
  return allCustomerFromJson(response.body);
}

Future<AllCustomer> get_allsearch(text, offset) async {
  var url = Uri.parse(
      '$customerurl/get_all_customers?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&search=$text&offset=$offset');
  var response = await http.get(url);
  // print('Response body: ${response.body}');
  return allCustomerFromJson(response.body);
}

Future<GetTransactionDetail> get_transaction_detail(transactionId) async {
  var url = Uri.parse(
      '$mainurl/usertransaction/transaction_detail?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&transaction_id=$transactionId');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getTransactionDetailFromJson(response.body);
}

Future<AllCustomer> get_allcustomerserch() async {
  var url = Uri.parse(
      '$customerurl/get_all_customers?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}');
  var response = await http.get(url);
  // print('Response body: ${response.body}');
  return allCustomerFromJson(response.body);
}

Future<GetAllCinfo> get_customer_info(customer_id) async {
  var url = Uri.parse(
      '$customerurl/get_all_customers?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_id=${customer_id}');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getAllCinfoFromJson(response.body);
}

Future<Getalltransaction> get_transaction(param) async {
  var url = Uri.parse(
      '$mainurl/usertransaction/get_all_transactions?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&$param');

  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getalltransactionFromJson(response.body);
}

Future<Getalltransaction> get_transactioncustomer(param, all) async {
  var url = Uri.parse(
      '$mainurl/usertransaction/get_all_transactions?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&customer_id=$param$all');

  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getalltransactionFromJson(response.body);
}

Future<AllCustomer> get_allflag({required String para}) async {
  var url = Uri.parse(
      '$customerurl/get_all_customers?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&is_favorite=1$para');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return allCustomerFromJson(response.body);
}

Future<Welcome> get_expenceproducts() async {
  var url = Uri.parse(
      '$expenseurl/getAllExpenseType?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  print('ldK;JSLAS');
  return welcomeFromJson(response.body);
}

Future<Deletexpencedata> delete_expenxe(expenceid) async {
  var url = Uri.parse(
      '$expenseurl/delete_expense?auth=${saveuser()?.company.auth}&expense_id=$expenceid');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return deletexpencedataFromJson(response.body);
}

Future<DeleteTransactionDetail> delete_transaction(
    {required String transactionid}) async {
  var url = Uri.parse(
      '$mainurl/usertransaction/delete_transaction?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&transaction_id=$transactionid');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return deleteTransactionDetailFromJson(response.body);
}

Future<Deletestaffmodel> delete_staff({required String companyuserid}) async {
  https: //web.lezrapp.com/lezr/services/usertransaction/deleteUser?auth=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjE5MiI.n_aiUyKLad7-BCrxA-18amw4D1Lbv-01mONOqPskBUk&company_user_id=81
  var url = Uri.parse(
      '$mainurl/usertransaction/deleteUser?auth=${saveuser()?.company.auth}&company_user_id=$companyuserid');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return deletestaffmodelFromJson(response.body);
}

Future<RankList> get_rank(page) async {
  var url = Uri.parse(
      '$mainurl/rank/rankList?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&page=$page');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return rankListFromJson(response.body);
}

Future<GetAllSubscriptions> get_subscriptions() async {
  var url = Uri.parse('$mainurl/package/packagelist');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getAllSubscriptionsFromJson(response.body);
}

Future<Getmycurrentpackage> get_currantpackages() async {
  var url = Uri.parse(
      '$mainurl/package/mycurrentpackage?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getmycurrentpackageFromJson(response.body);
}

Future<Salespurchaseexpenseschart> Salse_puchase_expensechart(year) async {
  var url = Uri.parse(
      '$mainurl/report/salesPurchaseExpense?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&year=$year&sales_purchase=0');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return salespurchaseexpenseschartFromJson(response.body);
}

Future<Salespaymentcustomerchart> Salse_payment_customerchart(year) async {
  var url = Uri.parse(
      '$mainurl/report/transactionsPayment?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&year=$year&customer_type_id=1');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return salespaymentcustomerchartFromJson(response.body);
}

Future<Purchasepaymentsupplierchart> Purchase_paymentsupplirechart(year) async {
  var url = Uri.parse(
      '$mainurl/report/transactionsPayment?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&year=$year&customer_type_id=2');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return purchasepaymentsupplierchartFromJson(response.body);
}

Future<Newcustomerchartmodel> newcustomerchart(year) async {
  var url = Uri.parse(
      '$mainurl/report/neCustomers?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&year=$year&customer_type_id=1');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return newcustomerchartmodelFromJson(response.body);
}

Future<Newcustomerchartmodel> newsupplierchart(year) async {
  var url = Uri.parse(
      '$mainurl/report/neCustomers?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&year=$year&customer_type_id=2');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return newcustomerchartmodelFromJson(response.body);
}

Future<Salesbynewandoldchartmodel> salesnewoldcustomchart(year, id) async {
  var url = Uri.parse(
      '$mainurl/report/customerTransactionsTracking?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&date=$year&customer_type_id=$id');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return salesbynewandoldchartmodelFromJson(response.body);
}

Future<Whatsappsendremider> sendwahatsapp(setremider, customerid) async {
  var url = Uri.parse(
      '$mainurl/transaction/createWhatsappImage?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&ft_set_reminder_type=$setremider&customer_id=$customerid');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return whatsappsendremiderFromJson(response.body);
}

Future<Getcompanys> getallcompany() async {
  var url = Uri.parse(
      '$mainurl/transaction/getAllCompanyByUser?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&page: 0');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getcompanysFromJson(response.body);
}

Future<SLogin> getsetcompany(String companyid) async {
  var url = Uri.parse(
      '$courl/setCompany?auth=&company_id=$companyid&user_id=${saveuser()?.company.userId}');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return sLoginFromJson(response.body);
}

Future<Getalltransactionbackup> getalltransactionbackup() async {
  var url = Uri.parse(
      '$mainurl/usertransaction/get_all_transactions_backup?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}&user_id=${saveuser()?.company.userId}&is_delete=0');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getalltransactionbackupFromJson(response.body);
}

Future<Getallexpensebackup> getallexpensesbackup() async {
  var url = Uri.parse(
      '$mainurl/expense/get_all_expense?auth=${saveuser()?.company.auth}&company_id=${saveuser()?.company.companyId}');
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return getallexpensebackupFromJson(response.body);
}

// Post Apis

Future<SLogin> stafflogin({
  required String mobileno,
  required String password,
}) {
  Map<String, dynamic> parameter = {
    'mobileno': mobileno,
    'password': password,
  };
  String url = '$courl/staffLogin';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return sLoginFromJson(response.body);
  });
}

Future<ChangecurrencyResponse> setcurrency({
  required String currency,
}) {
  Map<String, dynamic> parameter = {
    'company_id': saveuser()?.company.companyId.toString(),
    'user_id': saveuser()?.company.userId.toString(),
    'currency': currency,
  };
  String url = '$courl/update_currency?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return changecurrencyResponseFromJson(response.body);
  });
}

Future<Companyloginsendingotp> CompanyLoginsendotp({required String mobileno}) {
  Map<String, dynamic> parameter = {
    'mobileno': mobileno,
  };
  String url = '$courl/companyLogin';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return companyloginsendingotpFromJson(response.body);
  });
}

Future<Sendotp> sendotp({required String mobileno}) {
  Map<String, dynamic> parameter = {
    'mobile': mobileno,
  };
  String url = '$courl/send_otp?auth=';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return sendotpFromJson(response.body);
  });
}

Future<Resendotpmodel> resendotp({required String mobileno}) {
  Map<String, dynamic> parameter = {
    'mobile': mobileno,
  };
  String url = '$courl/resend_otp';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return resendotpmodelFromJson(response.body);
  });
}

Future<Vrotp> verifyotp({required String mobileno, required String otp}) {
  Map<String, dynamic> parameter = {
    'mobile': mobileno,
    'otp': otp,
  };
  String url = '$courl/verify_otp?auth=';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return vrotpFromJson(response.body);
  });
}

Future<Saveusermodel> saveuserapi(
    {required String mobileno}) {
  Map<String, dynamic> parameter = {
    'mobileno': mobileno,
    "device_token": ""
  };
  String url = '$courl/save_user';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return saveusermodelFromJson(response.body);
  });
}

Future<Saveusermodel> customeridflag(
    {required String customerid, required String yes}) {
  Map<String, dynamic> parameter = {
    'company_id': saveuser()?.company.companyId,
    'user_id': saveuser()?.company.userId,
    'customer_id': customerid,
    'is_favorite': yes,
  };
  String url = '$customerurl/markFlagged?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return saveusermodelFromJson(response.body);
  });
}

Future<AddCustomerdata> Addcustomerdataname({required var parameter}) {
  String url = '$customerurl/save_customer?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addCustomerdataFromJson(response.body);
  });
}

Future<Editprofilemodel> editorupdateprofe({required var parameter}) {
  String url = '$courl/update_company?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return editprofilemodelFromJson(response.body);
  });
}

Future<Editprofilemodel> editphonenumber({required var parameter}) {
  String url = '$courl/change_Phone?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return editprofilemodelFromJson(response.body);
  });
}

Future<SLogin> SAVE_COMPANY({required var parameter}) {
  String url = '$courl/save_company';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return sLoginFromJson(response.body);
  });
}

Future<Addcompanymodel> ADD_COMPANY({required var parameter}) {
  String url = '$courl/add_company?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addcompanymodelFromJson(response.body);
  });
}

Future<UpdateCustomerdata> updatecustomerdataname({required var parameter}) {
  String url = '$customerurl/update_customer?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return updateCustomerdataFromJson(response.body);
  });
}

Future<Addexpensedatasave> add_karo_expense({required var parameter}) {
  String url = '$mainurl/expense/save_expense?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addexpensedatasaveFromJson(response.body);
  });
}

Future<Addexpensedata> update_karo_expense({required var parameter}) {
  String url =
      '$mainurl/expense/update_expense?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addexpensedataFromJson(response.body);
  });
}

Future<Addtranctiondata> add_transaction_karo({required var parameter}) {
  String url =
      '$mainurl/usertransaction/save_transaction?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addtranctiondataFromJson(response.body);
  });
}

Future<Addtranctiondata> update_transaction_karo({required var parameter}) {
  String url =
      '$mainurl/usertransaction/update_transaction?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addtranctiondataFromJson(response.body);
  });
}

Future<Updatestaffmodel> update_user_staff({required var parameter}) {
  String url =
      '$mainurl/usertransaction/updateUser?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return updatestaffmodelFromJson(response.body);
  });
}

Future<Addstaffmodel> add_user_staff({required var parameter}) {
  String url =
      '$mainurl/usertransaction/addUser?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return addstaffmodelFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> deletecustomer({required var parameter}) {
  String url = '$customerurl/delete_customer?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> addcommet({required var parameter}) {
  String url =
      '$mainurl/usertransaction/save_transaction_comment?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> updatecommet({required var parameter}) {
  String url =
      '$mainurl/usertransaction/update_transaction_comment?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> deletecommet({required var parameter}) {
  String url =
      '$mainurl/usertransaction/delete_transaction_comment?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> deletetransactionimage(
    {required var parameter}) {
  String url =
      '$mainurl/usertransaction/remove_transaction_images?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> deleteexpenseimage({required var parameter}) {
  String url =
      '$mainurl/expense/deleteExpenseImage?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> uloadexpensesimage({required var parameter}) {
  String url =
      '$mainurl/expense/upload_expenses_images?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<Uploadimagemodelclass> uploadtransactiojnimage(
    {required var parameter}) {
  String url =
      '$mainurl/usertransaction/upload_transaction_images?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return uploadimagemodelclassFromJson(response.body);
  });
}

Future<Prebuypackagemodel> prebuypackageapi({required var parameter}) {
  String url =
      '$mainurl/package/finalbuypackage?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return prebuypackagemodelFromJson(response.body);
  });
}

Future<DeleteTransactionDetail> postbuypackage({required var parameter}) {
  String url = '$mainurl/package/buypackage?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return deleteTransactionDetailFromJson(response.body);
  });
}

Future<Smsremider> sendsmsremider({required var parameter}) {
  String url = '$courl/sendSMSPaymentReminder?auth=${saveuser()?.company.auth}';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return smsremiderFromJson(response.body);
  });
}

Future<Smschangesetting> smschangesetting({required var parameter}) {
  String url = '$courl/update_sms_setting?auth=';
  return http
      .post(Uri.parse(url), body: parameter, headers: headers)
      .then((http.Response response) {
    print('Response body: ${response.body}');
    return smschangesettingFromJson(response.body);
  });
}
