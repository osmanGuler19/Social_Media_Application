import 'package:feed_app/view/post_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/user_model.dart';
import '../model/post_model.dart';
import '../viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import '../view/user_detail_view.dart';
import '../view/post_detail_view.dart';

class FeedWidget extends StatelessWidget {
  final Post post;
  final User usr;
  const FeedWidget({Key? key, required this.post, required this.usr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostDetail(
                        post: post,
                        usr: usr,
                      )));
        },
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserDetail(
                          user: usr,
                        )));
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/user_${usr.id}.jpeg",
            ),
          ),
        ),
        title: Text("${usr.name}"),
        subtitle: Text(post.body!.length > 100
            ? '${post.body!.substring(0, 100)}...'
            : post.body!),
      ),
    );
  }
}
