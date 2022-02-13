import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../model/post_model.dart';

class PostDetail extends StatelessWidget {
  final User usr;
  final Post post;
  const PostDetail({Key? key, required this.usr, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: FittedBox(
        child: Container(
          margin: EdgeInsets.only(top: 20, right: 10, left: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/images/user_${usr.id}.jpeg",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '${usr.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple[50]!),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '${post.body}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
