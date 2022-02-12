import 'package:feed_app/viewmodel/post_viewmodel.dart';
import 'package:feed_app/widgets/feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../viewmodel/user_viewmodel.dart';
import '../viewmodel/post_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/post_model.dart';
import '../widgets/lazy_load_listview_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Provider.of<PostViewModel>(context, listen: false).getPost();
    });
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
        body: Consumer2<UserViewModel, PostViewModel>(
          builder: (context, userViewModel, postViewModel, child) {
            if (postViewModel.currentPostList.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return LazyLoadListViewBuilder(
                  loadMore: postViewModel.getPost,
                  itemBuilder: (context, index) {
                    final post_vm = postViewModel.currentPostList[index];
                    return FeedWidget(
                      userImagePath:
                          "assets/images/user_${post_vm.userId}.jpeg",
                      userName: "User",
                      userPost: "${postViewModel.currentPostList[index].body}",
                    );
                  },
                  loadingWidget: Center(
                    child: CircularProgressIndicator(),
                  ),
                  getListLength: postViewModel.getPostsLength,
                  noMoreItems: postViewModel.isLast());
            }
          },
        ));
  }
}
