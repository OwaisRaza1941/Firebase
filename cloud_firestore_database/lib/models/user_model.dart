class UserModel {
  String? id;
  String title;
  String description;

  UserModel({this.id, required this.title, required this.description});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'description': description};
  }
}
