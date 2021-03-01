import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategory extends StatelessWidget {
  final AppDatabase db;
  const EditCategory({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController =
        Get.put(CategoriesController(db));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Edit Categories .."),
        centerTitle: true,
        elevation: 0.5,
        actions: [IconButton(icon: Icon(Icons.check), onPressed: () {})],
      ),
      body: GetBuilder<CategoriesController>(
        builder: (CategoriesController cc) {
          return Container(
            child: Obx(() => ListView.separated(
                  itemCount: cc.categories.value.length,
                  itemBuilder: (_, index) {
                    TextEditingController _textEditingController =
                        new TextEditingController();

                    _textEditingController.text = cc.categories[index].name;
                    return ListTile(
                      leading: IconButton(
                          icon: Icon(Icons.book,
                              color: Color(cc.categories[index].primaryColor)),
                          onPressed: () {}),
                      title: TextField(
                        key: UniqueKey(),
                        controller: _textEditingController,
                        autofocus: false,
                        decoration: InputDecoration(
                            hintText: "Write what you thinking now ..!",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.close,
                        ),
                        onPressed: () {},
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Container(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: Divider());
                  },
                )),
          );
        },
      ),
    );
  }
}
