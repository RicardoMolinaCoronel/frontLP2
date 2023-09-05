
class Event {
  String title;
  String description;
  String nameEvent;
  String place;
  String urlImg;
  int likes;
  int comments;
  int shares;
  String dateCreated;
  String date;
  bool isLiked;
  
  Event(
      {required this.title,
      required this.description,
      required this.nameEvent,
      required this.place,
      required this.urlImg,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.dateCreated,
      required this.date,
      required this.isLiked});

      Map<String, dynamic> toJson() {
    return {
      'titulo': title,
      'descripcion': description,
      'nombreevento': nameEvent,
      'fechacreacion': dateCreated,
      'fechaevento': date,
      'lugarevento': place,
      'urlimg': urlImg,
    };


      }


}
