// ignore_for_file: prefer_const_constructors

import 'package:aplikasi_catatan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'widget/item_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catatan Pribadi'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.ADD), icon: Icon(Icons.add))
          ],
        ),
        body: Obx(() => controller.catatan.isEmpty
            ? Center(
                child: Text('Belum Ada Catatan'),
              )
            : ListView.builder(
                itemCount: controller.catatan.length,
                itemBuilder: (context, i) {
                  final data = controller.catatan[i];
                  return ItemView(data);
                })));
  }
}
