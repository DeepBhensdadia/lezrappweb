import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api/const_apis.dart';
import '../../api_model/customers/get_customers_api.dart';
import '../../getx controller/transactioncontrollers/transactionadd.dart';
import '../../helper.dart';

class select_account extends StatefulWidget {
  select_account({Key? key}) : super(key: key);

  @override
  State<select_account> createState() => _select_accountState();
}

class _select_accountState extends State<select_account>
    with SingleTickerProviderStateMixin {
  int index = 0;
  TabController? controller;
  Transactionadd customeridname = Get.put(Transactionadd());

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {

    controller = TabController(
      vsync: this,
      initialIndex: index,
      length: 2,
    );
    controller!.addListener(
      () {
        setState(
          () {
            searchController.clear();
            index = controller!.index;
          },
        );
      },
    );
    filteredCustomers = customeridname.postcustomer;
    filteredSuppliers = customeridname.postsupplire;
    super.initState();
  }
  List<Customer> filteredCustomers = [];
  List<Customer> filteredSuppliers = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 150,
          flexibleSpace: Column(
            children: [
              Container(
                height: 60,
                color: const Color(0xff294472),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Select Account',
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              letterSpacing: 0.2,
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            size: 30,
                            Icons.cancel,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: screenheight(context, dividedby: 17.4),
                color: Color(0xff294472),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    controller: searchController,
                    cursorHeight: 20,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      if(value.isNotEmpty){
                      filterLists(value);}
                      else{
                        filteredCustomers = customeridname.postcustomer;
                        filteredSuppliers = customeridname.postsupplire;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                      ),
                      hintText: 'Search Contacts',
                      hintStyle: TextStyle(
                          fontFamily: 'SF Pro Display',
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),

                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                child: TabBar(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  indicatorColor: Color(0xfff3d55e),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4,
                  padding: EdgeInsets.zero,
                  tabs: const [
                    Tab(
                      child: Text(
                        'CUSTOMER',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'SUPPLIER',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenheight(context, dividedby: 1),
            child:GetBuilder<Transactionadd>(builder: (customcontroller) =>  TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                Container(
                    child: ListView.builder(
                  itemCount: filteredCustomers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(filteredCustomers[index].customerName,
                            ),
                          onTap: () {
                            customcontroller.account.text = filteredCustomers[index].customerName;
                            customcontroller.customeridtest = filteredCustomers[index];
                            Get.back();

                          },
                        ),
                      ],
                    );
                  },
                )),       Container(
                    child: ListView.builder(
                  itemCount: filteredSuppliers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(

                          title: Text(filteredSuppliers[index].customerName,
                              ),
                          onTap: () {
                            customcontroller.account.text = filteredSuppliers[index].customerName;
                            customcontroller.customeridtest = filteredSuppliers[index];
                            Get.back();
                            // customcontroller.customername = customcontroller.postcustomer[index].customerName;
                          },
                        ),
                      ],
                    );
                  },
                )),

              ],
            ),),
          ),
        ),
      ),
    );
  }
  void filterLists(String searchQuery) {
    // Step 3: Update the filtered lists based on the search query
    setState(() {
      filteredCustomers = customeridname.postcustomer.where((customer) {
        return customer.customerName.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();

      filteredSuppliers = customeridname.postsupplire.where((supplier) {
        return supplier.customerName.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    });
  }
}
