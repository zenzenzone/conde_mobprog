import 'package:flutter/material.dart';
import 'package:conde_mobprog/widgets/notification.dart';

// 20 notifications, built with ListView.separated so the list scrolls.
const _notifications = [
  (name: 'Tony Stark', post: 'Morning workout', description: 'liked your post.'),
  (name: 'Natasha Romanoff', post: 'Mission recap', description: 'commented: Nice work out there.'),
  (name: 'Bruce Banner', post: 'New lab setup', description: 'shared your post.'),
  (name: 'Thor Odinson', post: 'Pizza review', description: 'reacted with a thunderous like.'),
  (name: 'Clint Barton', post: 'Weekend at the farm', description: 'commented: Peaceful. Suspicious.'),
  (name: 'Wanda Maximoff', post: 'Living room makeover', description: 'liked your post.'),
  (name: 'Peter Parker', post: 'Study group notes', description: 'tagged you in a comment.'),
  (name: 'Stephen Strange', post: 'Lost keys', description: 'commented: Check the other timeline.'),
  (name: 'Carol Danvers', post: 'Welcome back', description: 'liked your post.'),
  (name: 'Sam Wilson', post: 'Flight practice', description: 'shared your post.'),
  (name: 'Bucky Barnes', post: 'Throwback photo', description: 'commented: Was I really wearing that?'),
  (name: 'Scott Lang', post: 'Tiny update', description: 'liked your post.'),
  (name: 'Hope van Dyne', post: 'Team lunch', description: 'tagged you in a photo.'),
  (name: 'Nick Fury', post: 'Quarterly briefing', description: 'commented: Read it twice.'),
  (name: 'Pepper Potts', post: 'Budget review', description: 'liked your post.'),
  (name: 'Happy Hogan', post: 'Parking spot', description: 'commented: That is my spot.'),
  (name: 'Loki', post: 'Plot twist', description: 'reacted with a laugh.'),
  (name: 'Vision', post: 'Sunset view', description: 'liked your post.'),
  (name: 'Shuri', post: 'New gadget demo', description: 'shared your post.'),
  (name: 'Steve Rogers', post: 'Evening run', description: 'commented: Keep it up.'),
];

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: _notifications.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final n = _notifications[index];
          return NotificationWidget(
            name: n.name,
            post: n.post,
            description: n.description,
          );
        },
      ),
    );
  }
}