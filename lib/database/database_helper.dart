import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_it/database/db_constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/save_data_model.dart';

class DatabaseHelper extends ChangeNotifier {
  static final DatabaseHelper db = DatabaseHelper.internal();

  DatabaseHelper.internal();

  factory DatabaseHelper() {
    return db;
  }

  static Database? database;

  static Future<Database> getDatabase() async {
    if (database == null) {
      database = await initDB();
    }
    return database!;
  }

  //init data base
  static initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DBConstant.DATA_BASE_NAME);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(DBConstant.CREATE_BOOKS_TABLE);
    });
  }

  static Future<int> addBookToHome(SaveDataModel saveDataModel) async {
    int id = 0;
    try {
      final db = await getDatabase();
      id = await db.insert(DBConstant.BOOK_TABLE, saveDataModel.toMap());
    } catch (error) {
      print('DatabaseHelper.addProductInRetrievalTable: ' + error.toString());
    }
    return id;
  }

  static Future<List<SaveDataModel>> getBooks() async {
    List<SaveDataModel> books = [];

    try {
      final db = await getDatabase();
      List<Map<String, dynamic>> data = await db.query(DBConstant.BOOK_TABLE);
      if (data.isNotEmpty) {
        data.forEach((element) {
          SaveDataModel giftDataModel =
              SaveDataModel.fromJson(jsonEncode(element));

          print("Hey--->${giftDataModel.toMap()}");
          books.add(giftDataModel);
        });
      }
    } catch (error) {
      print('DatabaseHelper.addProductInRetrievalTable: ' + error.toString());
    }

    return books;
  }
}
