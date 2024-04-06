import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:totalx_task/core/exception/base_exception.dart';
import 'package:totalx_task/service/user_service/user_service.dart';

class UserCollectionController extends ChangeNotifier {
  Stream<QuerySnapshot<Map<String, dynamic>>> _collectStream =
      FireStoreservice.getUserStream();

  Stream<QuerySnapshot<Map<String, dynamic>>> get userCollection {
    return _collectStream;
  }

  void getUser() {
    try {
      _collectStream = FireStoreservice.getUserStream();
    } on BaseException catch (e) {
      throw e.message;
    }
    notifyListeners();
  }

  void sortUserAgeGrtrSixty() {
    try {
      _collectStream = FireStoreservice.sortUserAgeGrtrSixtyStream();
    } on BaseException catch (e) {
      throw e.message;
    }
    notifyListeners();
  }

  void sortUserAgelsthanSixty() {
    try {
      _collectStream = FireStoreservice.sortUserAgelsthanSixtyStream();
    } on BaseException catch (e) {
      throw e.message;
    }
    notifyListeners();
  }

  void search(String searchText) {
    try {
      _collectStream = FireStoreservice.searchStream(searchText);
    } on BaseException catch (e) {
      throw e.message;
    }
    notifyListeners();
  }
}
