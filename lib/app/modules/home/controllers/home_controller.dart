// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/catatan_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement HomeController

  var catatan = List<Catatan>.empty().obs;
  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  void onInit() async {
    super.onInit();
    getCatatan();
  }

  CollectionReference catatanCollection =
      FirebaseFirestore.instance.collection('catatan');

  void getCatatan() {
    try {
      catatanCollection.snapshots().listen((QuerySnapshot snapshot) {
        catatan.value = snapshot.docs
            .map((doc) => Catatan(
                  id: doc.id,
                  judul: doc['judul'],
                  isi: doc['isi'],
                ))
            .toList();
      });
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  Future<void> addCatatan(judul, isi) {
    return catatanCollection.add({
      'judul': judul,
      'isi': isi,
    }).then((value) {
      print("Data Ditambahkan");
      Get.back();
      // ignore: invalid_return_type_for_catch_error
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> removeCatatan(String id) {
    return catatanCollection
        .doc(id)
        .delete()
        .then((value) => dialogError("$id dihapus"));
  }

  Future<void> editCatatan(String id, judul, isi) {
    return catatanCollection.doc(id).update({
      'judul': judul,
      'isi': isi,
    }).then((value) {
      Get.back();
      // ignore: invalid_return_type_for_catch_error
    }).catchError((error) => print("Failed to update user: $error"));
  }

  Catatan findById(String id) {
    return catatan.firstWhere((element) => element.id == id);
  }

  void dialogError(String msg) {
    Get.defaultDialog(
        title: "Terjadi Kesalahan",
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ));
  }
}
