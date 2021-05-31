class ToDoModel {
  int id;
  String title;
  String status;
  String date;

  ToDoModel({this.title, this.status, this.date});

  ToDoModel.withID(this.id, this.title, this.status, this.date);

  // model to map

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();

    if (id != null) map["id"] = id;

    map["title"] = title;
    map["status"] = status;
    map["date"] = date;

    return map;
  }

  ToDoModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    status = map["status"];
    date = map["date"];
  }
}
