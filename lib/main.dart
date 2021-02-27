import 'package:fake_note_block/data/moor_database.dart';
import 'package:fake_note_block/ui/pages/notes/notePage.dart';
import 'package:fake_note_block/ui/pages/testCategory.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  final AppDatabase db = new AppDatabase();
  runApp(GetMaterialApp(
    home: NotePage(
      db: db,
    ),
    theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        brightness: Brightness.light),
    debugShowCheckedModeBanner: false,
  ));
}
// TestCategory(
//       db: db,
//     )
