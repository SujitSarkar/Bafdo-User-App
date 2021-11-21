import 'dart:io';

import 'package:bafdo/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends ChangeNotifier{

  final List<AddressModel> _addressList = [];
  get addressList => _addressList;
  static DatabaseHelper? _databaseHelper; // singleton DatabaseHelper
  static Database? _database; // singleton Database

  String addressTable = 'addressTable';
  String colId = 'id';
  String colCountry = 'country';
  String colAddress = 'address';
  String colcity = 'city';
  String colphone = 'phone';
  String colzip = 'zip';

  DatabaseHelper._createInstance(); //Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $addressTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$colCountry TEXT, $colAddress TEXT, $colcity TEXT, $colphone TEXT, $colzip TEXT)');
  }

  Future<Database> initializeDatabase() async {
    //Get the directory path for both android and iOS
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'address.db';
    var addressDatabase =
    await openDatabase(path, version: 1, onCreate: _createDB);
    return addressDatabase;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  //Fetch Map list from DB
  Future<List<Map<String, dynamic>>> getAddressMapList() async {
    Database db = await database;
    var result = await db.query(addressTable, orderBy: '$colId ASC');
    return result;
  }

  ///Get the 'Map List' and convert it to 'Cart List
  Future<void> getAddressList() async {
    _addressList.clear();
    var addressMapList = await getAddressMapList();
    int count = addressMapList.length;
    for (int i = 0; i < count; i++) {
      _addressList.add(AddressModel.fromMapObject(addressMapList[i]));
    }
    notifyListeners();
  }

  //update operation
  Future<int> updateAddress(AddressModel addressModel) async {
    Database db = await this.database;
    var result = await db.update(addressTable, addressModel.toMap(),
        where: '$colAddress = ?', whereArgs: [addressModel.address]);
    await getAddressList();
    return result;
  }

  ///Insert operation
  Future<int> insertAddress(AddressModel addressModel) async {
    Database db = await database;
    var result = await db.insert(addressTable, addressModel.toMap());
    await getAddressList();
    return result;
  }

  ///Delete operation
  Future<int> deleteAddress(String address) async {
    Database db = await database;
    var result = await db.delete(addressTable, where: '$colAddress = ?',
    whereArgs: [address]);
    await getAddressList();
    return result;
  }
}