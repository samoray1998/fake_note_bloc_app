import 'package:get/get.dart';
import 'package:fake_note_block/data/moor_database.dart';

class NoteController extends GetxController {
  final AppDatabase db;
  NoteController(this.db);
  var hasData = false.obs;
  var isLoading = RxBool(true);
  var notes = List<Note>().obs;
  NoteDaos _noteDaes;
  @override
  void onInit() async {
    _noteDaes = new NoteDaos(db);
    try {
      notes.value = await _noteDaes.getAllNotes().then((value) {
        if (value == null) {
          hasData.value = false;
          return null;
        } else {
          hasData.value = true;
          print('yes we have data ${hasData.value}');
          return value;
        }
      });
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
    update();
  }
}
