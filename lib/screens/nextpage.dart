import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';
class NextPage extends StatefulWidget {
  final int postid;
  const NextPage({super.key,required this.postid});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  @override
  void initState() {
    super.initState();
    callApi();
  }
  Post? post;

  void callApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${widget.postid}'));
    if(response.statusCode == 200){
      final body = response.body;
      final json = jsonDecode(body);
      setState(() {
        post = Post.fromJson(json);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Detail"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child:post == null
            ? Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User Id : ${post!.userId}",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10),
            Text("Id : ${post!.id}",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10),
            Text("Title : ${post!.title}",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10),
            Text("Body : ${post!.body}",style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
    );
  }
}