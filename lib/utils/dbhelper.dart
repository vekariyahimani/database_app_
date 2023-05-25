import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? database;

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Himani.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE incomeexpence(id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,amount TEXT,time TEXT,date TEXT,paymentMode TEXT,status TEXT,note TEXT)";
        db.execute(query);
      },
    );
  }

  insertData(
      {required String id,
        required category,
        required amount,
        required time,
        required date,
        required paymentMode,
        required status,
        required note}) async {
    database = await checkDB();
    database!.insert("incomeexpence", {
      "category": category,
      "amount": amount,
      "time": time,
      "date": date,
      "paymentMode": paymentMode,
      "status": status,
      "note": note
    });
  }

  readDB()
  async {
    database= await checkDB();

    String query="SELECT * FROM  incomeexpence";
    List<Map> list =await database!.rawQuery(query);
    return list;
  }

  Future<List<Map>> FilterReadDB({required statusCode}) async
  {
    database = await checkDB();
    String query = "SELECT * FROM incomeexpense WHERE status = $statusCode";

    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }


  Future<void> updateDB(
      {required category,required id, required amount, required notes, required paytypes, required date, required time, required status,required image}) async {
    database = await checkDB();

    database!.update("incomeexpense", {
      "category": category,
      "amount": amount,
      "notes": notes,
      "date": date,
      "time": time,
      "paytypes": paytypes,
      "status": status,
      "image" : image
    },where: "id = ?",whereArgs: [id]);
  }

  Future<void> deleteDB({required id}) async {
    database = await checkDB();
    database!.delete('incomeexpense', where: "id = ?", whereArgs: [id]);
  }
}
