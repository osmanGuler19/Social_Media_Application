import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'package:provider/provider.dart';
import 'viewmodel/user_viewmodel.dart';
import 'view/login_view.dart';
import 'view/homepage_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'GrandStack Flutter',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.pinkAccent),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginView(),
          //'/users': (context) => UserListScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
