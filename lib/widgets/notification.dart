import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conde_mobprog/widgets/custom_text.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.name,
    required this.post,
    required this.description,
  });

  final String name;
  final String post;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      child: Row(
        children: [
          const Icon(Icons.person),
          SizedBox(width: 10.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
                CustomText(
                  text: 'Post: $post',
                  fontSize: 13.sp,
                  color: Colors.black,
                ),
                CustomText(
                  text: description,
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ],
            ),
          ),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}