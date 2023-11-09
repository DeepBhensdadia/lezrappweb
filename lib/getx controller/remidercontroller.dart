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
  Timer? timers;
  List<PastTransaction> reminder = <PastTransaction>[];
  List<TodaysTransaction> today = [];
  List<dynamic> upcoming = [];
  RxBool Isloading = false.obs;
  int oldpageno = 0;
  int pageno = 50;

  get_all_remider() async {
    Isloading.value = true;
    await get_reminder("0").then(
      (value) {
        today.addAll(value.todaysTransactions);
        upcoming.addAll(value.upcommingTransactions);

        if (50 <= value.pastTransactions.length) {
          for (int i = oldpageno; i < pageno; i++) {
            reminder.add(value.pastTransactions[i]);
          }
        } else {
          reminder.addAll(value.pastTransactions);
        }

        update();
        Isloading.value = false;


        timers = Timer.periodic(Duration(seconds: 2), (timer) {
          if (pageno <= value.pastTransactions.length) {
            _loadData(value.pastTransactions);
          } else {
            timers?.cancel();
          }
        });
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }

  void _loadData(
    List<PastTransaction> value,
  ) async {
    pageno += 50;
    oldpageno += 50;
    List<PastTransaction> moreData = [];
    for (int i = oldpageno; i < pageno; i++) {
      moreData.add(value[i]);
    }
    reminder.addAll(moreData);
    update();
  }
}

class RemiderControllercustomer extends GetxController {
  Timer? timers;
  List<PastTransaction> reminder = <PastTransaction>[];
  List<TodaysTransaction> today = [];
  List<dynamic> upcoming = [];
  RxBool Isloading = false.obs;
  int oldpageno = 0;
  int pageno = 50;
  RxBool show = false.obs;

  get_all_remider() async {
    Isloading.value = true;
    await get_reminder("1").then(
      (value) {
        today.clear();
        today.addAll(value.todaysTransactions);
        upcoming.addAll(value.upcommingTransactions);
        if (50 <= value.pastTransactions.length) {
          for (int i = oldpageno; i < pageno; i++) {
            reminder.add(value.pastTransactions[i]);
          }
        } else {
          reminder.addAll(value.pastTransactions);
        }

        update();
        Isloading.value = false;



        timers = Timer.periodic(Duration(seconds: 2), (timer) {
          if (pageno <= value.pastTransactions.length) {
            _loadData(value.pastTransactions);
          } else {
            timers?.cancel();
          }
        });
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }

  void _loadData(
    List<PastTransaction> value,
  ) async {
    pageno += 50;
    oldpageno += 50;
    List<PastTransaction> moreData = [];
    for (int i = oldpageno; i < pageno; i++) {
      moreData.add(value[i]);
    }
    reminder.addAll(moreData);
    update();
  }
}

