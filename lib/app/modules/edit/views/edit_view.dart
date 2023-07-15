// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeC = Get.find<HomeController>();
    final data = homeC.findById(Get.arguments);
    controller.judul.text = data.judul!;
    controller.isi.text = data.isi!;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Catatan'),
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
                  onPressed: () => homeC.editCatatan(Get.arguments,
                      controller.judul.text, controller.isi.text),
                  child: Text("Edit Catatan"))
            ],
          ),
        ));
  }
}
