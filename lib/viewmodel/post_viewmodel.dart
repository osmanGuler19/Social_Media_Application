import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';
import '../model/post_model.dart';
import 'dart:convert';
import '../utils/string_helper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class PostViewModel extends ChangeNotifier {
  late List<Post> currentPostList;
  late List<User> currentPostsUser;
  int start = 0;
  late int limit;

  PostViewModel() {
    currentPostList = [];
    currentPostsUser = [];
  }

  Future<void> getPost() async {
    String searchUrl = getApiBaseUrl() + "posts";
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body) as List;
      if (parsed.isNotEmpty && start < parsed.length - 9) {
        limit = parsed.length;
        for (int i = start; i < start + 10; i++) {
          final post = Post.fromJson(parsed[i]);
          currentPostList.add(post);

          //I know this is very slow but I have to do this way. Because I have to get the user id from the post and
          //then I have to get the user for user detail page.
          //You can say why you didn't use Future.builder or StreamBuilder but they didn't work for me. I think
          //it's because of lazy loading situation
          String searchUrl =
              getApiBaseUrl() + "users?id=${currentPostList[i].userId}";
          final response = await http.get(Uri.parse(searchUrl));
          if (response.statusCode == 200) {
            final parsed = json.decode(response.body) as List;
            if (parsed.isNotEmpty) {
              User tmp = User.fromJson(parsed[0]);
              currentPostsUser.add(tmp);
            }
          }
        }

        moveStartIndex();
        notifyListeners();
      }
    }
  }

  void moveStartIndex() {
    if (start <= limit - 10) {
      start += 10;
    }
  }

  int getPostsLength() {
    return currentPostList.length;
  }

  bool isLast() {
    if (start == limit) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> resetPostList() async {
    currentPostList = [];
    notifyListeners();
    limit = 0;
    start = 0;
    await getPost();
  }
}
