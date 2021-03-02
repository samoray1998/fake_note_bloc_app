import 'package:fake_note_block/controllers/categoriesController.dart';
import 'package:fake_note_block/models/noteModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:fake_note_block/data/moor_database.dart';

class NoteController extends GetxController {
  final AppDatabase db;
  NoteController(this.db);
  CategoriesController _cc;
  var hasData = false.obs;
  var isLoading = RxBool(true);

  var noteCategories = List<Categorie>().obs;

  var notes = List<Note>().obs;
  NoteDaos _noteDaes;
  @override
  void onInit() async {
    _noteDaes = new NoteDaos(db);
    _cc = Get.put(CategoriesController(db));
    try {
      notes.value = await _noteDaes.getAllNotes();
      if (notes == null) {
        hasData.value = false;
      } else {
        hasData.value = true;
      }
      notes.value.forEach((element) {
        var cat = _cc.categories.firstWhere((x) => x.id == element.categoryId);
        noteCategories.value.add(cat);
        update();
      });
      // .then((value) {
      //   if (value == null) {
      //     hasData.value = false;
      //     return null;
      //   } else {
      //     hasData.value = true;
      //     print('yes we have data ${hasData.value}');
      //     return value;
      //   }
      // });
      // var x = await _noteDaes.getAllNotes();
      // hasData.value = true;
      // x.forEach((element) {
      //   notes.value.add(NoteModle(
      //       element.id, element.descreption, element.date, element.categoryId));
      // });
    } finally {
      isLoading.value = false;
      update();
      print('Loading finished ${isLoading.value}');
    }
    super.onInit();
  }

  void addNote(Note note) {
    _noteDaes.insertNote(note);
    notes.value.add(note);
    var cat = _cc.categories.firstWhere((x) => x.id == note.categoryId);
    noteCategories.value.add(cat);
    update();
  }

  void editNote(int index, Note note) {
    _noteDaes.updateNote(note);
    notes.value[index] = note;
    var cat = _cc.categories.firstWhere((x) => x.id == note.categoryId);
    noteCategories.value[index] = cat;
    //NoteModle(note.id, note.descreption, note.date, note.categoryId);
    update();
  }

  void deleteNote(int index, Note note) {
    _noteDaes.deleteNote(note);
    notes.value.removeAt(index);
    noteCategories.removeAt(index);
    update();
  }
}
