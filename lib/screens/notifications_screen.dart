import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conde_mobprog/constant.dart';
import 'package:conde_mobprog/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const _items = [
    ('Tony Stark liked your post.', '5 minutes ago'),
    ('Steve Rogers commented on your photo.', '1 hour ago'),
    ('Natasha Romanoff shared your post.', 'Yesterday'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final (message, time) = _items[i];
        return ListTile(
          leading: const Icon(Icons.person, color: fbPrimary),
          title: CustomText(
            text: message,
            fontSize: 13.sp,
            color: Colors.black,
          ),
          subtitle: CustomText(
            text: time,
            fontSize: 11.sp,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}