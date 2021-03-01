import 'package:fake_note_block/controllers/dropDownController.dart';
import 'package:fake_note_block/controllers/noteController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/widgets/myAppBar.dart';
import 'package:fake_note_block/ui/widgets/myDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotesPage extends StatelessWidget {
  final AppDatabase db;
  const AddNotesPage({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController(db));
    DropDownController _dropDC = Get.put(DropDownController(db));
    var currentDate = DateTime.now();
    TextEditingController _textEditingController = new TextEditingController();
    return Scaffold(
      appBar: myAppbar("Add your note .."),
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
                Text(
                    "Today ${DateTime.now().toString().split(' ')[1].split(':')[0] + ":" + DateTime.now().toString().split(' ')[1].split(':')[1]}"),
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
        child: Icon(Icons.check),
        onPressed: () {
          noteController.addNote(Note(
              id: null,
              descreption: _textEditingController.text,
              date: DateTime.now(),
              categoryId: _dropDC.dropDownValue.value.id));

          Get.back();
        },
      ),
    );
  }
}
