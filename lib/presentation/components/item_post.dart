import 'package:flutter_application_1/presentation/models/post.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatefulWidget {
  final Post child;
  bool themeDark;

  ItemPost({required this.child, this.themeDark = false});

  @override
  _ItemPostState createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 15.0, bottom: 10.0, top: 10.0, left: 15),
      child: Container(
        decoration: _boxDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _infoPostTexts(context),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _postPicture()),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //  _companyLogo(),

                      _likeIcon(),
                      _commentIcon(),
                      _shareIcon()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(context) {
    return BoxDecoration(
      color:
          this.widget.themeDark ? AppTheme.colors.red2 : AppTheme.colors.red2,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black45, offset: Offset(4.0, 4.0), blurRadius: 10.0),
      ],
    );
  }

  Widget _userPhoto() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      /*child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          this.widget.child.urlImg,
          width: 30.0,
        ),
      ),*/
    );
  }

  Widget _postPicture() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      /* child: ClipRRect(
        child: Image.network(
          this.widget.child.urlImg,
          width: 300.0,
        ),
      ),*/
    );
  }

  Widget _likeIcon() {
    return Row(children: [
      GestureDetector(
        child: Icon(
          this.widget.child.isLiked ? Icons.favorite : Icons.favorite_border,
          //  true ? Icons.favorite : Icons.favorite_border,
          color: this.widget.themeDark ? Colors.white : Colors.grey,
        ),
        onTap: () {
          setState(() {
            this.widget.child.isLiked = !this.widget.child.isLiked;
          });
        },
      ),
      Text("Like",
          style: TextStyle(
            fontSize: 15.0,
            color: this.widget.themeDark ? Colors.white : Colors.grey,
          ))
    ]);
  }

  Widget _commentIcon() {
    return Row(children: [
      GestureDetector(
        child: Icon(
          Icons.message,
          //  true ? Icons.favorite : Icons.favorite_border,
          color: this.widget.themeDark ? Colors.white : Colors.grey,
        ),
        onTap: () {
          setState(() {});
        },
      ),
      Text("Comment",
          style: TextStyle(
            fontSize: 15.0,
            color: this.widget.themeDark ? Colors.white : Colors.grey,
          ))
    ]);
  }

  Widget _shareIcon() {
    return Row(children: [
      GestureDetector(
        child: Icon(
          Icons.share,
          //  true ? Icons.favorite : Icons.favorite_border,
          color: this.widget.themeDark ? Colors.white : Colors.grey,
        ),
        onTap: () {
          setState(() {});
        },
      ),
      Text("Share",
          style: TextStyle(
            fontSize: 15.0,
            color: this.widget.themeDark ? Colors.white : Colors.grey,
          ))
    ]);
  }

  Widget _infoPostTexts(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            this.widget.child.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: this.widget.themeDark ? Colors.white : Colors.white,
            ),
          ),
          _userPhoto()
        ]),
        Text(
          this.widget.child.description,
          style: TextStyle(
            fontSize: 15.0,
            color: this.widget.themeDark ? Colors.white : Colors.white,
          ),
        ),
        SizedBox(height: 3.0),
        /* Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Theme.of(context).highlightColor,
              size: 15.0,
            ),
            SizedBox(width: 5.0),
            Text(
              this.widget.child.title,
              style: TextStyle(
                fontSize: 15.0,
                color: this.widget.themeDark ? Color(0XFFB7B7D2) : Colors.grey,
              ),
            )
          ],
        ),*/
      ],
    );
  }
}
