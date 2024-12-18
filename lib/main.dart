import 'package:flutter/material.dart';
import 'package:flutter_tugas9/Layout/Home/GridViewLearning.dart';
import 'package:flutter_tugas9/Layout/Home/ListViewLearning.dart';
import 'package:flutter_tugas9/Layout/Home/MyHomePage.dart';
import 'package:flutter_tugas9/Layout/Home/Newspage.dart';
import 'package:flutter_tugas9/Layout/Home/homepagewithmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomepage(),
        '/gridview': (context) => const GridViewLearning(),
        '/listview': (context) => const ListViewLearning(),
        '/menu': (context) => const HomepageWithMenu(),
        '/newspage': (context) => const Newspage(),
     },
);
}
}