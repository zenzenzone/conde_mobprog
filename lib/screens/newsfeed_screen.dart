import 'package:conde_mobprog/widgets/newsfeed_card.dart';
import 'package:flutter/material.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'Steve Rogers',
          avatarPath: 'assets/images/steve_rogers.jpg',
          currentUserAvatarPath: 'assets/images/current_user.jpg',
          postContent: 'I can do this all day! #AvengersAssemble',
          date: '2 hours ago',
          numOfLikes: 10,
        ),
        NewsfeedCard(
          userName: 'Tony Stark',
          avatarPath: 'assets/images/tony_stark.jpg',
          currentUserAvatarPath: 'assets/images/current_user.jpg',
          postContent: 'I am Iron Man. #GeniusBillionairePlayboyPhilanthropist',
          date: 'December 1, 2023',
          numOfLikes: 3000,
          imagePath: 'assets/images/iron_man.jpg',
        ),
      ],
    );
  }
}