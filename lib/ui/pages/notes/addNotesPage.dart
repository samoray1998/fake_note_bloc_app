import 'package:fake_note_block/controllers/noteController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotesPage extends StatelessWidget {
  final AppDatabase db;
  const AddNotesPage({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController(db));

    TextEditingController _textEditingController = new TextEditingController();
    return Scaffold(
      appBar: myAppbar("Add your note .."),
      body: Container(
          child: TextField(
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
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          noteController.addNote(Note(
              id: null,
              descreption: _textEditingController.text,
              date: DateTime.now(),
              categoryId: 1));
          Get.back();
        },
      ),
    );
  }
}
