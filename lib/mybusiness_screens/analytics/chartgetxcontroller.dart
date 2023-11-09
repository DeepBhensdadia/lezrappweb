
import 'package:get/get.dart';
import 'package:lezrapp/mybusiness_screens/analytics/chartoverall/sales_vs_purchase_vs_expense.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../api/const_apis.dart';
import 'chartmodel/newcustomermodel.dart';
import 'chartmodel/purchase_paymentofsupplierModel.dart';
import 'chartmodel/sales_payment_customer.dart';
import 'chartmodel/salesbynewandold.dart';
import 'chartmodel/salsepurchaseexpensemodel.dart';
import 'chartoverall/newcustomerchart.dart';
import 'chartoverall/newsupplierchart.dart';
import 'chartoverall/purchase_paymentofsupplier.dart';
import 'chartoverall/sales_payment_customer.dart';
import 'chartoverall/salsebynewandoldcustomer.dart';
import 'chartoverall/supplybynewoldchart.dart';

class ChartController extends GetxController{

  late Salespurchaseexpenseschart chartdatasal_pur_ex;
  Sales_purchase_and_expense(year) async {
    Get.context?.loaderOverlay.show();
    await Salse_puchase_expensechart(year).then((value) async {
      chartdatasal_pur_ex = value;
      Get.context?.loaderOverlay.hide();
Get.to(Sales_Purchase_Expense());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  Sales_purchase_and_expensewithoutgoing_only_update(year) async {
    Get.context?.loaderOverlay.show();
    await Salse_puchase_expensechart(year).then((value) async {
      chartdatasal_pur_ex = value;
      Get.context?.loaderOverlay.hide();
// Get.to(Sales_Purchase_Expense());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }


  late Salespaymentcustomerchart chartdatasales_paym_cus;

  Sales_purchase_and_customer(year) async {
    Get.context?.loaderOverlay.show();
    await Salse_payment_customerchart(year).then((value) async {
      chartdatasales_paym_cus = value;
      Get.context?.loaderOverlay.hide();
      Get.to(Sales_payment_customer());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  Sales_purchase_and_customer_onupdate(year) async {
    Get.context?.loaderOverlay.show();
    await Salse_payment_customerchart(year).then((value) async {
      chartdatasales_paym_cus = value;
      Get.context?.loaderOverlay.hide();
      // Get.to(Sales_payment_customer());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }



  late Purchasepaymentsupplierchart purchsesupplier;

  purchase_and_supplier(year) async {
    Get.context?.loaderOverlay.show();
    await Purchase_paymentsupplirechart(year).then((value) async {
      purchsesupplier = value;
      Get.context?.loaderOverlay.hide();
      Get.to(Purchase_Paymentofsupplier());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  purchase_and_supplier_onupdate(year) async {
    Get.context?.loaderOverlay.show();
    await Purchase_paymentsupplirechart(year).then((value) async {
      purchsesupplier = value;
      Get.context?.loaderOverlay.hide();
      // Get.to(Sales_payment_customer());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  late Newcustomerchartmodel newcustom;

  newcustomerdetail(year) async {
    Get.context?.loaderOverlay.show();
    await newcustomerchart(year).then((value) async {
      newcustom = value;
      Get.context?.loaderOverlay.hide();
      Get.to(NewCustomersChart());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  newcustomerdetail_onupdate(year) async {
    Get.context?.loaderOverlay.show();
    await newcustomerchart(year).then((value) async {
      newcustom = value;
      Get.context?.loaderOverlay.hide();
      // Get.to(Sales_payment_customer());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }


  late Newcustomerchartmodel newsuppli;

  newsupplierdetail(year) async {
    Get.context?.loaderOverlay.show();
    await newsupplierchart(year).then((value) async {
      newsuppli = value;
      Get.context?.loaderOverlay.hide();
      Get.to(NewSupplierChart());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  newsupplierdetail_onupdate(year) async {
    Get.context?.loaderOverlay.show();
    await newsupplierchart(year).then((value) async {
      newsuppli = value;
      Get.context?.loaderOverlay.hide();
      // Get.to(Sales_payment_customer());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  late Salesbynewandoldchartmodel salsbynewvsold;

  salsebynewvsold(year) async {
    Get.context?.loaderOverlay.show();
    await salesnewoldcustomchart(year,"1").then((value) async {
      salsbynewvsold = value;
      Get.context?.loaderOverlay.hide();
      Get.to(SalseByNewvsOld());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  salsebynewvsold_onupdate(year) async {
    Get.context?.loaderOverlay.show();
    await salesnewoldcustomchart(year,"1").then((value) async {
      salsbynewvsold = value;
      Get.context?.loaderOverlay.hide();
      // Get.to(Sales_payment_customer());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  late Salesbynewandoldchartmodel supplybynewold;

  supplybynewvsold(year) async {
    Get.context?.loaderOverlay.show();
    await salesnewoldcustomchart(year,"2").then((value) async {
  supplybynewold = value;
      Get.context?.loaderOverlay.hide();
      Get.to(SupplyByNewvsOld());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  supplybynewvsold_onupdate(year) async {
    Get.context?.loaderOverlay.show();
    await salesnewoldcustomchart(year,"2").then((value) async {
  supplybynewold = value;
      Get.context?.loaderOverlay.hide();
      // Get.to(Sales_payment_customer());
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

}