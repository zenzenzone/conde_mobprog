import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatar extends StatelessWidget {
  final String? avatarPath;
  final double radius;

  const UserAvatar({
    super.key,
    this.avatarPath,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    if (avatarPath != null && avatarPath!.isNotEmpty) {
      return CircleAvatar(
  radius: radius.r,
  backgroundColor: Colors.grey[300],
  backgroundImage: AssetImage(avatarPath!),
  onBackgroundImageError: (_, __) {},
);
    }

    return CircleAvatar(
      radius: radius.r,
      backgroundColor: Colors.grey[300],
      child: Icon(
        Icons.person,
        size: radius.sp,
        color: Colors.black87,
      ),
    );
  }
}