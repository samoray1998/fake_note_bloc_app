import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final int index;
  final AppDatabase db;
  const MyTextField({Key key, this.index, this.db}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CategoriesController cc = Get.put(CategoriesController(db));
    TextEditingController _textEditingController = new TextEditingController();
    _textEditingController.text = cc.categories[index].name;
    return TextField(
      key: UniqueKey(),
      controller: _textEditingController,
      autofocus: false,
      decoration: InputDecoration(
          hintText: "Category name",
          border: InputBorder.none,
          focusedBorder: InputBorder.none),
      style: TextStyle(
        fontSize: 16,
      ),

      // onChanged: (value) {
      //   print(value + " " + index.toString());
      //   cc.changedData.value.add(cc.categories[index]);
      // },
      onSubmitted: (value) {
        print(Categorie(
            id: cc.categories[index].id,
            name: value,
            primaryColor: cc.categories[index].primaryColor,
            seconderyColor: cc.categories[index].seconderyColor));
        cc.editCategory(Categorie(
            id: cc.categories[index].id,
            name: value,
            primaryColor: cc.categories[index].primaryColor,
            seconderyColor: cc.categories[index].seconderyColor));
      },
    );
  }
}
