import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  //TODO: Implement EditController

  late TextEditingController judul, isi;

  @override
  void onInit() {
    super.onInit();
    judul = TextEditingController();
    isi = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    judul.dispose();
    isi.dispose();
  }
}
