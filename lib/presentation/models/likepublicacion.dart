class likepublicacion {
  int idPost;
  int idLike;
  likepublicacion({required this.idPost, required this.idLike});
  Map<String, dynamic> toJson() {
    return {
      'publicacion_idpublicacion': idPost,
      'like_idlike': idLike,
    };
  }
}
