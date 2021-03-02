import 'package:fake_note_block/common/consts/listofColors.dart';
import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/controllers/noteController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/pages/categories/categoryPage.dart';
import 'package:fake_note_block/ui/widgets/widgetColorPicker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Drawer myDrawer(AppDatabase db) {
  CategoriesController cc = Get.put(CategoriesController(db));
  NoteController nc = Get.put(NoteController(db));
  TextEditingController textEditingController = new TextEditingController();

  return Drawer(
    child: SafeArea(
      child: Container(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: Text(
                    "Notes",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    child: ListTile(
                      leading: Icon(Icons.notes),
                      title: Text('All notes'),
                      trailing: Obx(() => Text("${nc.notes.value.length}")),
                    ),
                  ),
                  onTap: () => Get.back(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Divider(
                    thickness: 0.1,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    child: ListTile(
                      leading: Icon(Icons.star_border),
                      title: Text('My favorites'),
                      trailing: Text("0"),
                    ),
                  ),
                  onTap: () => Get.back(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Divider(
                    thickness: 0.1,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    child: ListTile(
                      leading: Icon(Icons.delete_outline),
                      title: Text('Deleted'),
                      trailing: Text("0"),
                    ),
                  ),
                  onTap: () => Get.back(),
                ),
                Divider(
                  thickness: 3,
                  //color: Colors.black,
                ),
                Container(
                  height: 40,
                  child: ListTile(
                    leading: Text('Categories'),
                    trailing: FlatButton(
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        Get.to(() => EditCategory(
                              db: db,
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 10,
                child: Container(
                  //height: 100,

                  child: GetBuilder<CategoriesController>(
                      builder: (CategoriesController c) {
                    return Container(
                        child: Obx(
                      () => ListView.builder(
                          itemCount: c.categories.value.length,
                          itemBuilder: (_, index) {
                            var xxx = nc.noteCategories
                                .where((x) => x.id == c.categories[index].id)
                                .toList();
                            return ListTile(
                              leading: Icon(
                                Icons.book,
                                color: Color(c.categories[index].primaryColor),
                              ),
                              title: Text(c.categories[index].name),
                              trailing: Text("${xxx.length}"),
                            );
                          }),
                    ));
                  }),
                )),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(
                            "New...",
                            style: TextStyle(color: Colors.lightBlue[800]),
                          ),
                        )),
                    onPressed: () {
                      Get.defaultDialog(
                          title: "Add new category for your notes.",
                          radius: 5,
                          content: Container(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(() => IconButton(
                                          icon: Icon(
                                            Icons.book,
                                            color: (cc.colorIndex.value == null)
                                                ? Colors.black
                                                : Color(colorsList[
                                                        cc.colorIndex.value]
                                                    .primaryColor),
                                          ),
                                          onPressed: () {
                                            Get.defaultDialog(
                                                title: "pick a color",
                                                content: WidgetColorPicker(
                                                  db: db,
                                                ));
                                          },
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: TextField(
                                          controller: textEditingController,
                                          decoration: InputDecoration(
                                              hintText: "   Category name"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            textEditingController.text = null;
                                            Get.back();
                                          },
                                          child: Text(
                                            "Cancel",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                    ),
                                    Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            if (cc.colorIndex.value == null) {
                                              cc.addCategory(Categorie(
                                                  id: null,
                                                  name: textEditingController
                                                      .text,
                                                  primaryColor:
                                                      defultColor.primaryColor,
                                                  seconderyColor: defultColor
                                                      .secondryColor));
                                              textEditingController.text = null;
                                              Get.back();
                                            } else {
                                              cc.addCategory(Categorie(
                                                  id: null,
                                                  name: textEditingController
                                                      .text,
                                                  primaryColor: colorsList[
                                                          cc.colorIndex.value]
                                                      .primaryColor,
                                                  seconderyColor: colorsList[
                                                          cc.colorIndex.value]
                                                      .secondryColor));
                                              cc.colorIndex.value = null;
                                              textEditingController.text = null;
                                              Get.back();
                                            }
                                          },
                                          child: Text("Ok",
                                              style: TextStyle(
                                                  color: Colors.blue))),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                  Divider(
                    thickness: 3,
                    //color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
