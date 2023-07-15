// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:aplikasi_catatan/app/modules/home/controllers/home_controller.dart';
import 'package:aplikasi_catatan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemView extends GetView<HomeController> {
  ItemView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(
        Routes.EDIT,
        arguments: data.id!,
      ),
      leading: CircleAvatar(),
      title: Text(data.judul!),
      subtitle: Text(data.isi!),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => controller.removeCatatan(data.id!),
      ),
    );
  }
}
