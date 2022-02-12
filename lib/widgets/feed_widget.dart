import 'package:flutter/material.dart';
import '../viewmodel/user_viewmodel.dart';

class FeedWidget extends StatelessWidget {
  final String userImagePath;
  final String userName;
  final String userPost;
  const FeedWidget(
      {Key? key,
      required this.userImagePath,
      required this.userName,
      required this.userPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            userImagePath,
          ),
        ),
        title: Text(userName),
        subtitle: Text(userPost.length > 100
            ? '${userPost.substring(0, 100)}...'
            : userPost),
      ),
    );
  }
}
