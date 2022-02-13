import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

class FeedWidget extends StatelessWidget {
  final String userImagePath;
  final String userName;
  final String userPost;
  final int userId;
  const FeedWidget(
      {Key? key,
      required this.userImagePath,
      required this.userName,
      required this.userPost,
      required this.userId})
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
          Fluttertoast.showToast(
            msg: "Tap on $userName",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        },
        leading: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundImage: AssetImage(
              userImagePath,
            ),
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
