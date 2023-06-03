class HistoryModel {
  String? image;
  String? note;
  String? date;
  HistoryModel.fromJson(Map<String, dynamic>? json) {
    image = json!['image'];
    note = json['note'];
    date = json['date'];
  }
}
