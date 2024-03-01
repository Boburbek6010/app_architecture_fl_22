import 'dart:convert';
List<PostModel> postModelFromJson(String str) => List.from(jsonDecode(str).map((e) => PostModel.fromJson(e)));
String postModelToJson(PostModel data) => json.encode(data.toJson());
class PostModel {
  PostModel({
      this.userId, 
      this.title, 
      this.body, 
      this.id,});

  PostModel.fromJson(dynamic json) {
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
    id = json['id'];
  }

  int? userId;
  String? title;
  String? body;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['title'] = title;
    map['body'] = body;
    map['id'] = id;
    return map;
  }

}