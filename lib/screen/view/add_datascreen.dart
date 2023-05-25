import 'dart:async';

import 'package:database_app/screen/controller/add_controller.dart';
import 'package:database_app/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  AddController addController = Get.put(AddController());
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtNotes = TextEditingController();
  TextEditingController txtCate = TextEditingController();
  TextEditingController txtpay = TextEditingController();

  @override
  void initState() {
    super.initState();
    addController.day.value = addController.currentDate.day;
    addController.mon.value = addController.currentDate.month;
    addController.year.value = addController.currentDate.year;
    addController.hour.value = addController.currentTime.hour;
    addController.minute.value = addController.currentDate.minute;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade800,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome !",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Text(
                            "All Dear Customer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 700,
            ),
            child: Container(
              height: 66,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        addController.staus.value = 0;
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          barrierColor: Colors.white30,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Container(
                            height: 470,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.50),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() => addController.staus.value == 1
                                          ? Text("Expense",
                                              style: TextStyle(
                                                  color: Colors.green.shade800,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold))
                                          : Text(
                                              "Income",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green.shade800),
                                            )),
                                      Expanded(child: SizedBox()),
                                      InkWell(
                                        onTap: () {
                                          var date =
                                              "${addController.day.value}/${addController.mon.value}/${addController.year.value}";
                                          DBHelper dbhelper = DBHelper();
                                          dbhelper.readDB();
                                          dbhelper.insertData(
                                              id: "1",
                                              category: txtCate.text,
                                              amount: txtAmount.text,
                                              time: "",
                                              date: date,
                                              paymentMode: txtpay.text,
                                              status: addController.staus.value,
                                              note: txtNotes.text);
                                          addController.readData();
                                          Get.back();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                  color: Colors.green.shade800,
                                                  width: 2)),
                                          child: Text("Add",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      Colors.green.shade800)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtCate,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Category",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtAmount,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Amount",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                            color: Colors.green.shade800,
                                            width: 2)),
                                    child: Row(children: [
                                      InkWell(
                                          onTap: () async {
                                            addController.currentDate =
                                                (await showDatePicker(
                                                    context: context,
                                                    initialDate: addController
                                                        .currentDate,
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime.now()))!;
                                            addController.year.value =
                                                addController.currentDate.year;
                                            addController.mon.value =
                                                addController.currentDate.month;
                                            addController.day.value =
                                                addController.currentDate.day;
                                          },
                                          child: Icon(Icons.calendar_today,
                                              color: Colors.green.shade800)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() => Text(
                                            "${addController.day.value}/${addController.mon.value}/${addController.year.value}",
                                            style: TextStyle(
                                                color: Colors.green.shade800,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtpay,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Pay type",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtNotes,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Note",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Income",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  InkWell(
                      onTap: () {
                        addController.staus.value = 1;
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          barrierColor: Colors.white30,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Container(
                            height: 470,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.50),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() => addController.staus.value == 1
                                          ? Text("Expense",
                                              style: TextStyle(
                                                  color: Colors.green.shade800,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold))
                                          : Text(
                                              "Income",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green.shade800,
                                              ),
                                            )),
                                      Expanded(child: SizedBox(),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          var date =
                                              "${addController.day.value}/${addController.mon.value}/${addController.year.value}";
                                          DBHelper dbhelper = DBHelper();
                                          dbhelper.insertData(
                                              id: "1",
                                              category: txtCate.text,
                                              amount: txtAmount.text,
                                              time: "",
                                              date: date,
                                              paymentMode: txtpay.text,
                                              status: addController.staus.value,
                                              note: txtNotes.text);
                                          addController.readData();
                                          Get.back();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                  color: Colors.green.shade800,
                                                  width: 2)),
                                          child: Text("Add",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.green.shade800)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtCate,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Category",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtAmount,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Amount",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                            color: Colors.green.shade800,
                                            width: 2)),
                                    child: Row(children: [
                                      InkWell(
                                          onTap: () async {
                                            addController.currentDate =
                                                (await showDatePicker(
                                                    context: context,
                                                    initialDate: addController
                                                        .currentDate,
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime.now()))!;
                                            addController.year.value =
                                                addController.currentDate.year;
                                            addController.mon.value =
                                                addController.currentDate.month;
                                            addController.day.value =
                                                addController.currentDate.day;
                                          },
                                          child: Icon(Icons.calendar_today,
                                              color: Colors.green.shade800)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() => Text(
                                            "${addController.day.value}/${addController.mon.value}/${addController.year.value}",
                                            style: TextStyle(
                                                color: Colors.green.shade800,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtpay,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Pay type",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: txtNotes,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.green.shade800)),
                                        label: Text(
                                          "Note",
                                          style: TextStyle(
                                              color: Colors.green.shade800,
                                              fontSize: 13),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Expense",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget ShowDialogCate() {
    return Container(
      width: 200,
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                addController.changecategory(addController.categories[index]);
                Get.back();
              },
              child: Text(
                "${addController.categories[index]}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
        itemCount: addController.categories.length,
      ),
    );
  }

  Widget ShowDialogPayType() {
    return Container(
        height: 200,
        width: 150,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    addController.changePaytype(addController.payTypes[index]);
                    Get.back();
                  },
                  child: Text(
                    "${addController.payTypes[index]}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            },
            itemCount: addController.payTypes.length));
  }
}
