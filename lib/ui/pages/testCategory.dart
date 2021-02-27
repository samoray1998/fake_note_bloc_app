import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestCategory extends StatelessWidget {
  final AppDatabase db;
  const TestCategory({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesController _categoryController =
        Get.put(CategoriesController(db));
    return Scaffold(
      appBar: myAppbar('just for testing'),
      body: Container(
          child: Obx(() => ListView.builder(
              itemCount: _categoryController.categories.value.length,
              itemBuilder: (_, index) {
                return Text(
                  _categoryController.categories[index].id.toString(),
                  style: TextStyle(
                      color: Color(
                          _categoryController.categories[index].primaryColor)),
                );
              }))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _categoryController.addCategory(Categorie(
              id: null,
              name: "work",
              primaryColor: 0XFFEF6C00,
              seconderyColor: 0XFFFFE0B2));
        },
      ),
    );
  }
}
