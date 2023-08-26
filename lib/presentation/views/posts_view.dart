import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/components/item_post.dart';
import 'package:flutter_application_1/presentation/models/post.dart';
import 'package:flutter_application_1/presentation/models/post.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';

class PostsView extends StatefulWidget {
  List<Post> posts;
  PostsView(this.posts, {super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.blue1,
      body: SafeArea(
        child: ListView.builder(
          itemCount: super.widget.posts.length,
          itemBuilder: (context, index) {
            return ItemPost(child: super.widget.posts[index]);
          },
        ),
      ),
    );
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
