import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownController extends GetxController {
  final AppDatabase db;
  DropDownController(this.db);
  var dropDownValue = Rx<Categorie>();

  CategoriesController cc;
  @override
  void onInit() {
    cc = Get.put(CategoriesController(db));
    print("this is the length of list ${cc.categories.length}");
    dropDownValue.value = cc.categories[cc.categories.length - 1];
    // TODO: implement onInit
    super.onInit();
  }

  void valueChanged(Categorie newCat) {
    dropDownValue.value = newCat;
    update();
  }
}
