import 'package:flutter/material.dart';
import '../viewmodel/user_viewmodel.dart';

class FeedWidget extends StatelessWidget {
  final Image userImage;
  final String userName;
  final String userPost;
  const FeedWidget(
      {Key? key,
      required this.userImage,
      required this.userName,
      required this.userPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
