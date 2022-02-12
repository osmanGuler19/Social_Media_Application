import 'package:flutter/material.dart';
import '../viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.supervised_user_circle_sharp),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
