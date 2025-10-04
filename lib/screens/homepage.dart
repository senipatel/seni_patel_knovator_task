import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../model/post.dart';
import 'nextpage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Post> data = [];
  final List<int> isRead = [];
  final remainingTimes = {};
  final timers = {};

  @override
  void initState() {
    super.initState();
    callApi();
  }

  // call api and get data from api
  void callApi() async {
    // log("API call started...");
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        final body = response.body;
        final List<dynamic> json = jsonDecode(body);

        setState(() {
          data = json.map((e) => Post.fromJson(e)).toList();
          for (var post in data) {
            remainingTimes[post.id] = post.duration;
            _startTimer(post);
          }
        });

        // log("API function is running");
      } else {
        log("Error: ${response.statusCode}");
      }
    } catch (e) {
      log("Exception: $e");
    }
    // log("API call finished.");
  }

  // to change colors of list
  void openedPost(int id) {
    setState(() {
      isRead.add(id);
    });
  }

  // count down timer
  void _startTimer(Post post) {
    timers[post.id] = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTimes[post.id]! > 0) {
          setState(() {
            remainingTimes[post.id] = remainingTimes[post.id]! - 1;
          });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post List"), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final singleData = data[index];
            return ListTile(
              onTap: () {
                openedPost(singleData.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(postid: singleData.id),
                  ),
                );
              },
              minLeadingWidth: 10,
              tileColor: isRead.contains(singleData.id)
                  ? Colors.white
                  : Colors.yellow.shade300,
              leading: Text(
                singleData.id.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              title: Text(singleData.title, style: const TextStyle(fontSize: 15)),
              subtitle: Text(
                singleData.body.toString().substring(0, 30),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              trailing: Text(
                "${remainingTimes[singleData.id] ?? 0}s",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          },
        ),
      ),
    );
  }
}
