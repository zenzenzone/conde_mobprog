import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String imagePath;
  final double height;

  const PostImage({
    super.key,
    required this.imagePath,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: height,
            width: double.infinity,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const Text('Image not found'),
          );
        },
      ),
    );
  }
}