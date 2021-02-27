import 'package:fake_note_block/controllers/noteController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/pages/notes/addNotesPage.dart';
import 'package:fake_note_block/ui/widgets/myAppBar.dart';
import 'package:fake_note_block/ui/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotePage extends StatelessWidget {
  final AppDatabase db;

  const NotePage({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.put(NoteController(db));

    return Scaffold(
      drawer: myDrawer(db),
      appBar: myAppbar("All Notes ..."),
      body: GetBuilder<NoteController>(builder: (NoteController nn) {
        return Container(
          child: Obx(() {
            if (nn.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (nn.hasData.value) {
                return ListView.builder(
                    itemCount: nn.notes.value.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: ListTile(
                          title: Text(nn.notes[index].descreption),
                          subtitle: Text(
                              nn.notes[index].date.toString().split(' ')[0]),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: Text("You have no notes yet ..!"),
                );
              }
            }
          }),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => AddNotesPage(
                db: db,
              ));
        },
      ),
    );
  }
}
