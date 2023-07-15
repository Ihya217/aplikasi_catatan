// ignore_for_file: unnecessary_overrides

import 'package:aplikasi_catatan/app/data/providers/catatan_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/catatan_model.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement HomeController

  var catatan = List<Catatan>.empty().obs;
  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  void onInit() {
    super.onInit();
    getCatatan2();
  }

  Future<void> getCatatan() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('catatan').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  void getCatatan2() {
    CatatanProvider().getAllCatatan().then((response) {
      final data = Catatan(
        id: response["name"],
        judul: response["judul"],
        isi: response["isi"],
      );
      print(data);
    });
  }

  void dialogError(String msg) {
    Get.defaultDialog(
        title: "Terjadi Kesalahan",
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ));
  }

  void addCatatan(String judul, isi) {
    if (judul != '' && isi != '') {
      CatatanProvider().postCatatan(judul, isi).then((response) {
        final data = Catatan(
          id: response["name"],
          judul: judul,
          isi: isi,
        );
        catatan.add(data);
        Get.back();
      });
    } else {
      dialogError("Semua Input Harus Diisi");
    }
  }

  void removeCatatan(String id) {
    CatatanProvider()
        .deleteCatatan(id)
        .then((value) => catatan.removeWhere((element) => element.id == id));
  }

  void editCatatan(String id, judul, isi) {
    CatatanProvider().editCatatan(id, judul, isi).then((value) {
      final data = findById(id);
      data.judul = judul;
      data.isi = isi;
      catatan.refresh();
      Get.back();
    });
  }

  Catatan findById(String id) {
    return catatan.firstWhere((element) => element.id == id);
  }
}
