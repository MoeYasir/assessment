import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moe/postModel.dart';
import 'package:moe/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () async {
              await ();
              setState(() {});
            },
            child: Text(posts![0].userId.toString())),
      ),
    );
  }
}
