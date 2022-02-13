import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserDetail extends StatelessWidget {
  final User user;
  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hey ${user.name}!"),
      ),
      body: Center(
          child: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/user_${user.id}.jpeg",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Card(
              elevation: 10,
              child: Text(
                "Name : " + user.name.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Text(
                "UserName : " + user.username.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Text(
                "Email : " + user.email.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Text(
                "Phone : " + user.phone.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Text(
                "Address : " + user.address.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Text(
                "Company : " + user.company.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Text(
                "Website : " + user.website.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
