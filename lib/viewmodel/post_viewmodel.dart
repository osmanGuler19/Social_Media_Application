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
  int start = 0;
  late int limit;

  PostViewModel() {
    currentPostList = [];
  }

  Future<void> getPost() async {
    String searchUrl = getApiBaseUrl() + "posts";
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body) as List;
      if (parsed.isNotEmpty && start < parsed.length - 9) {
        limit = parsed.length;
        for (int i = start; i < start + 10; i++) {
          currentPostList.add(Post.fromJson(parsed[i]));
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
}
