import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/helper.dart';

import '../../getx controller/summarycontroller.dart';

class Businesshealth extends StatefulWidget {
  const Businesshealth({Key? key}) : super(key: key);

  @override
  State<Businesshealth> createState() => _BusinesshealthState();
}

class _BusinesshealthState extends State<Businesshealth> {
  List<bool> maxline = List.generate(3, (index) => false);
  // bool maxline = false;
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  List title = ["Sales - Collection", "Purchase - Payment", "Sales - Expenses"];
  List data = [
    "For any business an efficient Sales and Collection cycle is essential to ensure steady cash flow for a business. This sales and collection meter outlines the revenue cycle activities,beginning when a customer purchases a good or service and ending when the business receives the full payment.",
    "The accounts payable process must also be efficient and accurate in order for the company's financial statementsto be accurate and complete. A poorly run accounts payable process can also mean missing a discount for payingsome bills early. If vendor invoices are not paid when they become due, supplier relationships could bestrained.Just as delays in paying bills can cause problems, so could paying bills too soon. If Supplier invoices are paidearlier than necessary, there may not be cash available to pay some other bills by their due dates.",
    "Tracking the Sales & Expenses is a necessary chore that helps small business owners track and manage their money effectively. Every business must try to lower the burden of operating expenses as much as it can. Such expenseshave a direct impact on profitability. It also affects' the ability of a business to compete with others in theindustry. However, these expenses are necessary and unavoidable."
  ];
// List persantage = [ _summarycontroller.summary.summery.salesPerformance.progress,];
  @override
  Widget build(BuildContext context) {
    List persantage = [ _summarycontroller.summary.summery.salesPerformance.progress,_summarycontroller.summary.summery.paymentPerformance.progress,_summarycontroller.summary.summery.expensePerformance.progress,];
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar:
              AppBar(title: Text("Business Health".tr), backgroundColor: custom),
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15, left: 15),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.zero,
                  child: Container(
                    // height: 200,
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            title[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            // height: 5,
                            width: screenwidth(context, dividedby: 1.2),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 5,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Excellent",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 5,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Good",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 5,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Fair",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 5,
                                            color: Colors.orange,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Poor",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 5,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Very Bad",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  left: screenwidth(context, dividedby: 1.27) *
                                      persantage[index] /
                                      100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color:getColorForPercentage(persantage[index]), width: 3)),
                                    height: 20,
                                    width: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: maxline[index] == false ? 3 : 50,
                                  textAlign: TextAlign.justify,
                                  "${data[index]}",
                                  style: TextStyle(
                                      letterSpacing: 0.8,
                                      color: custom,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    maxline[index] = !maxline[index];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(50),
                                      border:
                                          Border.all(width: 2, color: custom)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3),
                                    child: Text("View More",
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
  Color getColorForPercentage(double percentage) {
    if (percentage <= 20) {
      return Colors.blue;
    } else if (percentage <= 40) {
      return Colors.green;
    } else if (percentage <= 60) {
      return Colors.amber;
    } else if (percentage <= 80) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
