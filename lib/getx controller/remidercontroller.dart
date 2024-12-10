import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Icons_row/reminder/remainder_screen.dart';
import '../api/const_apis.dart';
import '../api_model/report/reminder.dart';
import '../mainscreen.dart';

class RemiderController extends GetxController {
  List<PastTransaction> reminder = <PastTransaction>[];
  List<PastTransaction> allData = <PastTransaction>[];
  List<TodaysTransaction> today = [];
  List<dynamic> upcoming = [];
  RxBool upadted = false.obs;

  void get_all_remider() async {
    await get_reminder("0").then(
      (value) {
        today = value.todaysTransactions;
        upcoming = value.upcommingTransactions;
        update();
        allData.addAll(value.pastTransactions);
        loadData();
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }

  int first = 50;
  void loadData() async {
    if(first > reminder.length - 50){
      reminder.addAll(allData.sublist(first - 50, first));
      first += 50;
    }else{
      reminder.addAll(allData);
    }
    print("loadData ${reminder.length}");
    upadted.isFalse;
    update();
  }
}

class RemiderControllercustomer extends GetxController {
 List<PastTransaction> reminder = <PastTransaction>[];
  List<PastTransaction> allData = <PastTransaction>[];
  List<TodaysTransaction> today = [];
  List<dynamic> upcoming = [];
  // RxBool show = false.obs;

  get_all_remider() async {
    await get_reminder("1").then(
      (value) {
        today.clear();upcoming.clear();reminder.clear();
        today.addAll(value.todaysTransactions);
        upcoming.addAll(value.upcommingTransactions);
        update();
        allData.addAll(value.pastTransactions);
        loadData();
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }

  int first = 50;
  void loadData() async {
    if(first > reminder.length - 50){
      reminder.addAll(allData.sublist(first - 50, first));
      first += 50;
    }else{
      reminder.addAll(allData);
    }
    print("loadData ${reminder.length}");
    update();
  }
}
