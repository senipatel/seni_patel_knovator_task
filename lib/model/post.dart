import 'dart:math';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  final int duration;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.duration,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final durations = [10, 15, 20, 25, 30];
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      duration: durations[Random().nextInt(durations.length)],
    );
  }

}