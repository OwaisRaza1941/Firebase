class AddPostModel {
  String id;
  String title;
  String description;

  AddPostModel({
    required this.id,
    required this.title,
    required this.description,
  });

  //// Convert To JSON In DartModel

  factory AddPostModel.fromMap(Map<String, dynamic> map) {
    return AddPostModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  /// Convert To DartModel In JSON
  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "description": description};
  }
}
