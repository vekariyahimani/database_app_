import 'package:database_app/screen/controller/add_controller.dart';
import 'package:database_app/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AddController addController = Get.put(AddController());

  @override
  void initState() {
    super.initState();
    DBHelper dbHelper = DBHelper();
    dbHelper.readDB();
    addController.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dear Customer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "TOTAL AMOUNT",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image/rupess.png",
                            color: Colors.white,
                            height: 20,
                            width: 20,
                          ),
                          Text(
                            "2000",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 60, right: 60),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/dollar.png",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Income",
                          style: TextStyle(color: Colors.black45, fontSize: 15),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Image.asset(
                          "assets/image/dollar.png",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Expence",
                          style: TextStyle(color: Colors.black45, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 70, right: 50),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/image/rupess.png",
                          color: Colors.black,
                          height: 13,
                          width: 13,
                        ),
                        Text(
                          "2000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Image.asset(
                          "assets/image/rupess.png",
                          color: Colors.black,
                          height: 13,
                          width: 13,
                        ),
                        Text(
                          "2000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 320, left: 20, right: 20),
            child: Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: addController.transtionList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(4),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${addController.transtionList[index]['category']}",
                                    style: TextStyle(
                                        color:
                                            addController.transtionList[index]
                                                        ['status'] ==
                                                    "1"
                                                ? Colors.green
                                                : Colors.red,
                                        fontSize: 19,fontWeight: FontWeight.w600)),
                                Text(
                                    "\$ ${addController.transtionList[index]['amount']}",
                                    style: TextStyle(
                                        color:
                                            addController.transtionList[index]
                                                        ['status'] ==
                                                    "1"
                                                ? Colors.green
                                                : Colors.red,
                                        fontSize: 17,fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Text(
                                "${addController.transtionList[index]['paymentMode']}",
                                style: TextStyle(
                                    color: addController.transtionList[index]
                                                ['status'] ==
                                            "1"
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 710,
            ),
            child: Container(
              height: 66,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                    Icon(
                      Icons.messenger_outline,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/insert');
                      },
                      child: Icon(
                        Icons.person_outline,
                        size: 30,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('data');
                      },
                      child: Container(
                        margin: EdgeInsets.all(7),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
