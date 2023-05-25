import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dbhelper.dart';

class AddController extends GetxController
{
  DateTime date = DateTime.now();
  DateTime? indate;
  RxInt day=0.obs;
  RxString dropdown="".obs;
  RxInt mon=0.obs;
  RxInt year=0.obs;
  RxInt income=0.obs;

  TimeOfDay currentTime = TimeOfDay.now();
  DateTime currentDate=DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  RxInt hour = 0.obs;
  RxInt minute = 0.obs;
  RxString inclick="".obs;
  RxString onclick="".obs;

  RxList<Map> transtionList =<Map>[].obs;
  RxInt staus=0.obs;



  void inch()
  {
    currentDate=DateTime.now();
    changeDate(currentDate);
  }

  void changeDate(date) {
    currentDate = date;
    day.value=currentDate.day;
    mon.value=currentDate.month;
    year.value=currentDate.year;
    update();
  }

  void changeTime(time) {
    currentTime = time;
    hour.value = currentTime.hour;
    minute.value = currentTime.minute;
    update();
  }

  RxList categories = [
    "Salary",
    "Food an Dining",
    "Shopping",
    "Travelling",
    "Entertainment",
    "Medical",
    "Personal Care",
    "Education",
    "Bills and Utilities",
    "Investments",
    "Rent",
    "Taxes",
    "Insurance",
    "Gifts and Donation",
    "Coupans",
    "Sold items"
  ].obs;

  RxList payTypes = ["online", "debit card", "credit card", "offline"].obs;



  void changecategory(String categories)
  {
    inclick.value=categories;

  }


  void changePaytype(String payTypes)
  {
    onclick.value=payTypes;

  }

  void click()
  {
    income!=income;
  }



  Future<void> readData() async {

    DBHelper dbHelper=DBHelper();
    transtionList.value=await dbHelper.readDB();
    print(transtionList.value);

  }
  Future<void> FilterReadDB(statusCode) async {
    DBHelper dbHelper=DBHelper();
    transtionList.value = await dbHelper.FilterReadDB(statusCode: statusCode);
  }

  Future<void> deleteData(id) async {
    DBHelper dbHelper=DBHelper();
    dbHelper.deleteDB(id: id);

    readData();
  }

  void updateData(
      {required category,
        required id,
        required amount,
        required notes,
        required paytypes,
        required date,
        required time,
        required image,
        required status}) {
    DBHelper dbHelper=DBHelper();
    dbHelper.updateDB(
        category: category,
        id: id,
        amount: amount,
        notes: notes,
        paytypes: paytypes,
        date: date,
        time: time,
        status: status,
        image: image);

    readData();
  }

  Future<void> deletData(id) async {
    DBHelper dbHelper=DBHelper();
    dbHelper.deleteDB(id: id);

    readData();
  }



}