import 'package:database_app/screen/view/add_datascreen.dart';
import 'package:database_app/screen/view/alldata_insert.dart';
import 'package:database_app/screen/view/home_screen.dart';
import 'package:database_app/screen/view/splsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SplshScreen(),),
        GetPage(name: '/home', page: () => HomeScreen(),),
        GetPage(name: '/data', page: () => AddDataScreen(),),
        GetPage(name: '/insert', page: () => AllInsertData(),),
      ],
    )
  );
}