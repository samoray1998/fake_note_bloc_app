class NoteModle {
  final int id;
  final String descreption;
  final DateTime date;
  final int categoryId;
  final bool isChecked;
  NoteModle(
      {this.id,
      this.descreption,
      this.date,
      this.categoryId,
      this.isChecked = false});
}
