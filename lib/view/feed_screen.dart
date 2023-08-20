import 'package:flutter/material.dart';

import '../widgets/home_post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) {
          return const HomePostCard(
            profilePicUrl:
                'https://media.istockphoto.com/id/953079238/photo/smiling-man-with-hat-and-sunglasses.webp?b=1&s=170667a&w=0&k=20&c=vQfZPBTgg9PpwktCJ6Wqi5F2CPQ9hj9q9Q5bXiGnjxo=',
            userPostUrl:
                'https://images.unsplash.com/photo-1608725131946-c73a151f2f8a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGluc3RhZ3JhbSUyMHBvc3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
            userName: 'Rahul',
          );
        },
      ),
    );
  }
}
