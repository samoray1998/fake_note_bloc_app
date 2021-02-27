import 'package:fake_note_block/data/moor_database.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final AppDatabase db;
  CategoriesController(this.db);
  var categories = List<Categorie>().obs;
  var colorIndex = RxInt(null);
  CategoryDaos _categoryDaos;
  @override
  void onInit() async {
    _categoryDaos = new CategoryDaos(db);
    categories.value = await _categoryDaos.getAllCategories();
    super.onInit();
  }

  void addCategory(Categorie categorie) {
    _categoryDaos.insertCategory(categorie);
    categories.value.add(categorie);
    update();
  }
}
