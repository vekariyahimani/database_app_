import 'dart:io';
import 'dart:typed_data';

import 'package:database_app/screen/controller/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllInsertData extends StatefulWidget {
  const AllInsertData({Key? key}) : super(key: key);

  @override
  State<AllInsertData> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<AllInsertData> {
  AddController addController = Get.put(AddController());
  TextEditingController txtcate = TextEditingController();
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtpaytypes = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txttime = TextEditingController();
  TextEditingController txtstatus = TextEditingController();
  TextEditingController txtnotes = TextEditingController();

  @override
  void initState() {
    super.initState();
    addController.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    addController.readData();
                  },
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "All",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius:BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)
                  ),
                  child: TextButton(
                    onPressed: () {
                      addController.FilterReadDB(1);
                    },
                    child: Text(
                      "Income",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextButton(
                    onPressed: () {
                      addController.FilterReadDB(0);
                    },
                    child: Text(
                      "Expense",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
                  () => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    print(addController.transtionList[index]['status']);
                    return Container(
                      height: 80,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                        addController.transtionList[index]['status'] == "0"
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${addController.transtionList[index]['category']}",
                                style: TextStyle(fontSize: 19,),
                              ),
                              Text(
                                "${addController.transtionList[index]['amount']}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${addController.transtionList[index]['date']}",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "${addController.transtionList[index]['time']}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              txtcate = TextEditingController(
                                  text: addController.transtionList[index]
                                  ['category']);
                              txtamount = TextEditingController(
                                  text: addController.transtionList[index]
                                  ['amount']);
                              txtnotes = TextEditingController(
                                  text: addController.transtionList[index]
                                  ['notes']);
                              txtpaytypes = TextEditingController(
                                  text: addController.transtionList[index]
                                  ['paytypes']);
                              txtdate = TextEditingController(
                                  text: addController.transtionList[index]
                                  ['date']);
                              txttime = TextEditingController(
                                  text: addController.transtionList[index]
                                  ['time']);
                              txtstatus = TextEditingController(
                                  text: addController.transtionList[index]
                                  ['status']);

                              var id = addController.transtionList[index]['id'];
                              updateDialog(id);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              var id = addController.transtionList[index]['id'];
                              addController.transtionList(id);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: addController.transtionList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateDialog(id) {
    Get.defaultDialog(
      backgroundColor: Colors.white54,
      title: "Update",
      titleStyle: TextStyle(color: Colors.blue.shade900),
      content: Column(
        children: [
          TextField(
            controller: txtcate,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              hintText: "Category",
              prefixIcon: Icon(Icons.category,color: Colors.blue.shade900,),
              border: OutlineInputBorder(

              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: txtamount,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.currency_rupee,color: Colors.blue.shade900,),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),

          TextField(
            controller: txtpaytypes,
            decoration: InputDecoration(
              hintText: "PayType",
              prefixIcon: Icon(Icons.currency_bitcoin,color: Colors.blue.shade900,),
              hintStyle: TextStyle(color: Colors.black45,fontSize: 14),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),

          TextField(
            controller: txtdate,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.blue.shade900),
              prefixIcon: Icon(Icons.calendar_month,color: Colors.blue.shade900,),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  addController.updateData(
                      category: txtcate.text,
                      id: id,
                      amount: txtamount.text,
                      notes: txtnotes.text,
                      paytypes: txtpaytypes.text,
                      date: txtdate.text,
                      time: txttime.text,
                      status: txtstatus.text, image:"",
                      );

                  Get.back();
                },
                child: Text("Update"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel",style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}