class TodoModel {
  final String id;
  final String title;
  final bool iscompleted;

  TodoModel({required this.id, required this.title, required this.iscompleted});

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'iscompleted': iscompleted};
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'], title: json['title'], iscompleted: json['iscompleted']);
  }
}
