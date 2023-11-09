import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lezrapp/getx%20controller/summarycontroller.dart';

import '../../api/const_apis.dart';
import '../../api_model/transaction/transaction_detail_api.dart';

class transactioncommetcontroller extends GetxController {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  late GetTransactionDetail trandetail;
  RxBool show = false.obs;
  RxBool circuler = false.obs;
  getdetails(transactionId) {
    circuler.value = true;

    get_transaction_detail(transactionId).then((value) {
      trandetail = value;
      show.value = true;
      circuler.value = false;

      update();
    }).onError((error, stackTrace) {
      circuler.value = false;

      print(error);
    });
  }

  addtransactioncomment(transactionid, String text) {
    circuler.value = true;

    Map<String, dynamic> para = {
      "transaction_id": transactionid,
      "comment_file_name": "",
      "comment_description": text,
      "company_id": saveuser()?.company.companyId,
      "user_id": saveuser()?.company.userId,
      "company_user_id":  _summarycontroller.staff.isTrue ? saveuser()?.user.companyUserId :"0"
    };
    addcommet(parameter: para).then((value) {

      getdetails(transactionid);
      // Fluttertoast.showToast(msg: value.message);
      circuler.value = false;
      update();

    }).onError((error, stackTrace) {
      circuler.value = false;
      print(error);
    });
  }

  updatetransactioncomment(transactionid, commetid, String text) {
    circuler.value = true;

    Map<String, dynamic> para = {
      "transaction_comment_id": commetid,
      "comment_description": text,
      "company_id": saveuser()?.company.companyId,
      // "user_id":saveuser()?.company.userId,
      "company_user_id":  _summarycontroller.staff.isTrue ? saveuser()?.user.companyUserId :"0",
    };
    updatecommet(parameter: para).then((value) {


      getdetails(transactionid);
      // Fluttertoast.showToast(msg: value.message);
      circuler.value = false;
      update();
    }).onError((error, stackTrace) {
      circuler.value = false;
      print(error);
    });
  }

  deletetransactioncomment(transactionid, commentid) {
    circuler.value = true;

    Map<String, dynamic> para = {
      "company_id": saveuser()?.company.companyId,
      "user_id": saveuser()?.company.userId,
      "transaction_comment_id": commentid
    };
    deletecommet(parameter: para).then((value) {


      getdetails(transactionid);
      // Fluttertoast.showToast(msg: value.message);
      circuler.value = false;
      update();
    }).onError((error, stackTrace) {
      circuler.value = false;
      print(error);
    });
  }
}
