import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));
class Post{
  Post({
    required this.name ,
    required this.desc
  });
  String name ;
  String desc ;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
      name:json["name"]  ,
      desc:json["desc"]
  );

}

