import 'dart:convert';

class Post {
  String title;
  String description;
  String urlImg;
  int likes;
  int comments;
  int shares;
  String dateCreated;
  bool isLiked;
  Post(
      {required this.title,
      required this.description,
      required this.urlImg,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.dateCreated,
      required this.isLiked});


      Map<String, dynamic> toJson() {
    return {
      'titulo': title,
      'descripcion': description,
      'fechacreacion': dateCreated,
      'urlimg': urlImg,
    };
      }

}


