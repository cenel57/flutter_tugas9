import 'package:flutter/material.dart';
import 'package:flutter_tugas9/Layout/Home/NewsCard.dart';
import 'package:flutter_tugas9/Model/Getnews.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  Future<List<Getnews>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      return getPostsData.map((i) => Getnews.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  late Future<List<Getnews>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<List<Getnews>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              } else if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var post = snapshot.data![index];
                    return Newscard(getnews: post);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.length,
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
     ),
);
}
}