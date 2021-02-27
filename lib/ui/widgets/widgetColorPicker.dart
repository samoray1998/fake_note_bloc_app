import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:fake_note_block/common/consts/listofColors.dart';
import 'package:get/get.dart';

class WidgetColorPicker extends StatelessWidget {
  final AppDatabase db;
  const WidgetColorPicker({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController =
        Get.put(CategoriesController(db));
    return Container(
      width: 300,
      height: 250,
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 3, mainAxisSpacing: 3),
          itemCount: colorsList.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                print(index);
                categoriesController.colorIndex.value = index;
                Get.back();
              },
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: Color(colorsList[index].primaryColor),
                    border: Border.all(
                      color: Color(colorsList[index].primaryColor),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            );
          }),
      // ),
    );
  }
}
