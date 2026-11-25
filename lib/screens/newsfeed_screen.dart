import 'package:flutter/material.dart';
import 'package:conde_mobprog/widgets/newsfeed_card.dart';

typedef _Post = ({
  String userName,
  String postContent,
  String date,
  int numOfLikes,
  bool hasImage,
  String? imagePath,
  String? avatarPath,
});

const _currentUserAvatar = 'assets/images/current_user.jpg';

// Enhancement 1: every post is just data. Add or remove rows here and the
// list updates by itself. hasImage true with no imagePath shows a placeholder.
const List<_Post> _posts = [
  (
    userName: 'Steve Rogers',
    postContent: 'I can do this all day! #AvengersAssemble',
    date: '2 hours ago',
    numOfLikes: 10,
    hasImage: false,
    imagePath: null,
    avatarPath: 'assets/images/steve_rogers.jpg',
  ),
  (
    userName: 'Tony Stark',
    postContent: 'I am Iron Man. #GeniusBillionairePlayboyPhilanthropist',
    date: 'December 1, 2023',
    numOfLikes: 3000,
    hasImage: true,
    imagePath: 'assets/images/iron_man.jpg',
    avatarPath: 'assets/images/tony_stark.jpg',
  ),
  (
    userName: 'Natasha Romanoff',
    postContent: 'Quiet mission, loud results. Debrief at 0600.',
    date: 'November 30, 2023',
    numOfLikes: 1250,
    hasImage: false,
    imagePath: null,
    avatarPath: null,
  ),
  (
    userName: 'Bruce Banner',
    postContent: 'New lab setup is finally done. Please do not touch the coffee machine.',
    date: 'November 29, 2023',
    numOfLikes: 421,
    hasImage: true,
    imagePath: null,
    avatarPath: null,
  ),
  (
    userName: 'Thor Odinson',
    postContent: 'Midgard pizza might be the best thing I have ever eaten. #ThunderGodReview',
    date: 'November 27, 2023',
    numOfLikes: 5600,
    hasImage: true,
    imagePath: null,
    avatarPath: null,
  ),
  (
    userName: 'Clint Barton',
    postContent: 'Day off at the farm. Zero arrows fired. Zero.',
    date: 'November 25, 2023',
    numOfLikes: 318,
    hasImage: false,
    imagePath: null,
    avatarPath: null,
  ),
  (
    userName: 'Wanda Maximoff',
    postContent: 'Redecorated the living room. Everything looks better in red.',
    date: 'November 22, 2023',
    numOfLikes: 2100,
    hasImage: true,
    imagePath: null,
    avatarPath: null,
  ),
  (
    userName: 'Peter Parker',
    postContent: 'Late for class again. The web-shooters were not the problem this time.',
    date: 'November 20, 2023',
    numOfLikes: 987,
    hasImage: false,
    imagePath: null,
    avatarPath: null,
  ),
  (
    userName: 'Stephen Strange',
    postContent: 'Fourteen million possible futures and I still lost my keys.',
    date: 'November 18, 2023',
    numOfLikes: 760,
    hasImage: true,
    imagePath: null,
    avatarPath: null,
  ),
  (
    userName: 'Carol Danvers',
    postContent: 'Back from a very long trip. Missed you all. Where is the good coffee?',
    date: 'November 15, 2023',
    numOfLikes: 4300,
    hasImage: false,
    imagePath: null,
    avatarPath: null,
  ),
];

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsfeedCard(
          userName: post.userName,
          postContent: post.postContent,
          date: post.date,
          numOfLikes: post.numOfLikes,
          hasImage: post.hasImage,
          imagePath: post.imagePath,
          avatarPath: post.avatarPath,
          currentUserAvatarPath: _currentUserAvatar,
        );
      },
    );
  }
}