import 'package:fake_note_block/common/consts/listofColors.dart';
import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/controllers/dropDownController.dart';
import 'package:fake_note_block/controllers/noteController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/widgets/myAppBar.dart';
import 'package:fake_note_block/ui/widgets/myDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotesPage extends StatelessWidget {
  final AppDatabase db;
  final int index;
  const AddNotesPage({Key key, this.db, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController(db));
    DropDownController _dropDC = Get.put(DropDownController(db));
    CategoriesController cc = Get.put(CategoriesController(db));
    var currentDate = DateTime.now();
    TextEditingController _textEditingController = new TextEditingController();
    if (index != null) {
      _textEditingController.text = noteController.notes[index].descreption;
      _dropDC.dropDownValue.value = cc.categories.firstWhere(
          (element) => element.id == noteController.notes[index].categoryId,
          orElse: () => Categorie(
              id: null,
              name: "No Category",
              primaryColor: defultColor.primaryColor,
              seconderyColor: defultColor.secondryColor));
    } else {
      _textEditingController.text = null;
    }
    return Scaffold(
      appBar:
          myAppbar((index == null) ? "Add your note .." : "Edit your note .."),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 10,
                ),
                MyDropDownList(
                  db: db,
                ),
                Spacer(),
                Text((index == null)
                    ? "Today ${DateTime.now().toString().split(' ')[1].split(':')[0] + ":" + DateTime.now().toString().split(' ')[1].split(':')[1]}"
                    : "${noteController.notes[index].date.toString().split(' ')[0]}"),
                SizedBox(
                  width: 10,
                )
              ],
            )),
            Expanded(
                flex: 10,
                child: ListView(
                  children: [
                    TextField(
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
                      maxLines: 1000,
                    ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon((index == null) ? Icons.check : Icons.edit),
        onPressed: () {
          if (index == null) {
            noteController.addNote(Note(
                id: null,
                descreption: _textEditingController.text,
                date: DateTime.now(),
                categoryId: _dropDC.dropDownValue.value.id));
          } else {
            noteController.editNote(
                index,
                Note(
                    id: noteController.notes[index].id,
                    descreption: _textEditingController.text,
                    date: noteController.notes[index].date,
                    categoryId: _dropDC.dropDownValue.value.id));
          }

          Get.back();
        },
      ),
    );
  }
}
