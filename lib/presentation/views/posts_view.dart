import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/components/item_post.dart';
import 'package:flutter_application_1/presentation/models/likepublicacion.dart';
import 'package:flutter_application_1/presentation/models/post.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';
import 'package:flutter_application_1/presentation/models/connection.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostsView extends StatefulWidget {
  List<Post> posts;
  PostsView(this.posts, {super.key});
  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  int count = 0;
  late Future<List<likepublicacion>> likes;

  /* Future<List<likepublicacion>> _getLikes() async {
    List<likepublicacion> likes = [];
    String ipPuerto = Connection.direccionIp + ":" + Connection.puerto;
    final url = 'http://' + ipPuerto + '/rest/likepublicacion/findAll/json';
    final response = await http.get(Uri.parse(url));

    List<likepublicacion> posts = [];
    if (response.statusCode != 400) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      for (var item in jsonData) {
        likes.add(likepublicacion(
            idPost: item["publicacion_idpublicacion"],
            idLike: item["like_idlike"]));
      }
    }
    return likes;
  }*/

  Future<List<Post>> _getPosts() async {
    String ipPuerto = Connection.direccionIp + ":" + Connection.puerto;
    final url = 'http://' + ipPuerto + '/rest/publicacion/findAll/json';
    final response = await http.get(Uri.parse(url));

    List<Post> posts = [];
    if (response.statusCode != 400) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      for (var item in jsonData) {
        String titulo, descripcion, urlImg, fechacreacion;
        if (item["titulo"] == null) {
          titulo = "NoExiste";
        } else {
          titulo = item["titulo"];
        }
        if (item["descripcion"] == null) {
          descripcion = "NoExiste";
        } else {
          descripcion = item["descripcion"];
        }

        if (item["urlimg"] == null || item["urlimg"] == "URL de la imagen") {
          urlImg = "NoExiste";
        } else {
          urlImg = item["urlimg"];
        }
        if (item["fechacreacion"] == null) {
          fechacreacion = "NoExiste";
        } else {
          fechacreacion = item["fechacreacion"];
        }
        posts.add(Post(
            title: titulo,
            description: descripcion,
            urlImg: urlImg,
            likes: 5,
            comments: 5,
            shares: 5,
            dateCreated: fechacreacion,
            isLiked: false));
      }
    }
    return posts;
  }

  late Future<List<Post>> _listadoPosts;

  @override
  void initState() {
    super.initState();
    // actualizarLikes();
    actualizarPosts();
  }

  Future<void> actualizarPosts() async {
    setState(() {
      _listadoPosts = _getPosts();
    });
  }

  /*Future<void> actualizarLikes() async {
    setState(() {
      likes = _getLikes();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.colors.blue1,
        body: RefreshIndicator(
            onRefresh: () {
              return actualizarPosts();
            },
            child: FutureBuilder(
                future: _listadoPosts,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return SafeArea(
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return ItemPost(child: snapshot.data![index]);
                        },
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }))));
  }

  Widget _recentPosts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            'For You',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
