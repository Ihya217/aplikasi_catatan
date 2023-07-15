// ignore_for_file: prefer_const_constructors

import 'package:aplikasi_catatan/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambahkan Catatan'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                autocorrect: false,
                controller: controller.judul,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Judul",
                    hintText: "Silahkan Isi Judul ..."),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                autocorrect: false,
                controller: controller.isi,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Isi",
                    hintText: "Silahkan Isi Catatan ..."),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => Get.find<HomeController>()
                      .addCatatan(controller.judul.text, controller.isi.text),
                  child: Text("Tambahkan Catatan"))
            ],
          ),
        ));
  }
}
