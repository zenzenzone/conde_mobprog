import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conde_mobprog/constant.dart';
import 'package:conde_mobprog/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'post_image.dart';
import 'user_avatar.dart';
import 'action_button.dart';

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String? imagePath;
  final String? avatarPath;
  final String? currentUserAvatarPath;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.imagePath,
    this.avatarPath,
    this.currentUserAvatarPath,
  });

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  late int _likes = widget.numOfLikes;
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final likeColor = _isLiked ? fbPrimary : Colors.grey;

    return Card(
      margin: EdgeInsets.all(10.w),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                UserAvatar(avatarPath: widget.avatarPath),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.userName,
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: widget.date,
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 3.w),
                        Icon(Icons.public, color: Colors.grey, size: 15.sp),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: 5.h),

            // Post content
            CustomText(
              text: widget.postContent,
              fontSize: 12.sp,
              color: Colors.black,
            ),
            SizedBox(height: 5.h),

            // Optional image
            if (widget.imagePath != null)
              PostImage(imagePath: widget.imagePath!),

            // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  icon: _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                  label: '$_likes',
                  color: likeColor,
                  onPressed: _toggleLike,
                ),
                ActionButton(
                  icon: Icons.chat_bubble_outline,
                  label: 'Comment',
                  color: fbDarkPrimary,
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.redo,
                  label: 'Share',
                  color: fbDarkPrimary,
                  onPressed: () {},
                ),
              ],
            ),

            // Comment box
            Row(
              children: [
                UserAvatar(
                  avatarPath: widget.currentUserAvatarPath,
                  radius: 15,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.w),
                    alignment: Alignment.centerLeft,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: 'View all comments',
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}