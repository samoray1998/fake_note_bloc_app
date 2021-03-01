import 'package:fake_note_block/controllers/dropDownController.dart';
import 'package:fake_note_block/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDropDownList extends StatelessWidget {
  final AppDatabase db;
  const MyDropDownList({Key key, this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropDownController _downController = Get.put(DropDownController(db));
    return Container(
      // height: 100,
      child: Obx(() => DropdownButton(
            icon: Icon(
              Icons.arrow_drop_down,
              // color: Colors.red,
            ),
            value: _downController.dropDownValue.value,
            iconSize: 24,
            underline: Container(
              height: 2,
              color: Colors.blueAccent,
            ),
            onChanged: (value) {
              _downController.valueChanged(value);
            },
            items: _downController.cc.categories
                .map<DropdownMenuItem<Categorie>>((element) {
              return DropdownMenuItem(
                  value: element,
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.book,
                        color: Color(element.primaryColor),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(element.name),
                    ],
                  )));
            }).toList(),
          )),
    );
  }
}
// ListTile(
//                       title: Text(element.name),
//                       leading: Icon(
//                         Icons.book,
//                         color: Color(element.primaryColor),
//                       ),
//                     ),
