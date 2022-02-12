import 'package:flutter/material.dart';

typedef BooleanCallback = Future<bool> Function();

typedef GetListLength = int Function();

class LazyLoadListViewBuilder extends StatelessWidget {
  final VoidCallback loadMore;
  final IndexedWidgetBuilder itemBuilder;
  final Widget loadingWidget;
  final GetListLength getListLength;
  final bool noMoreItems;
  LazyLoadListViewBuilder(
      {Key? key,
      required this.loadMore,
      required this.itemBuilder,
      required this.loadingWidget,
      required this.getListLength,
      required this.noMoreItems})
      : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(_scrollListener);
    return ListView.builder(
      padding: EdgeInsets.all(8),
      physics: BouncingScrollPhysics(),
      controller: _controller,
      itemBuilder: (context, index) {
        if (index == getListLength()) {
          return loadingWidget;
        } else
          return itemBuilder(context, index);
      },
      itemCount: noMoreItems ? getListLength() : getListLength() + 1,
    );
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent &&
        !noMoreItems) {
      loadMore();
    }
  }
}
