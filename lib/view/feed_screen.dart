import 'package:flutter/material.dart';
import '../widgets/home_post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);
  static const List<String> listUrl = [
    "https://github.com/raghav042/feedmedia/raw/main/Belly%20Dancer_%20%23shorts.mp4",
    "https://github.com/raghav042/feedmedia/raw/main/Gravitas%20Shorts_%20Who%20really%20is%20funding%20Russia's%20war%20on%20Ukraine_.mp4",
    "https://github.com/raghav042/feedmedia/blob/main/blog-thumb-01.jpg?raw=true",
    "https://github.com/raghav042/feedmedia/raw/main/Create%20a%20Short%20to%20'Pink%20Venom'%20%26%20show%20us%20your%20moves%20with%20%23PinkVenomChallenge%20only%20on%20YouTube%20Shorts.mp4",
    "https://github.com/raghav042/feedmedia/blob/main/blue.jpg?raw=true",
    "https://github.com/raghav042/feedmedia/raw/main/XO%20TEAM%20DANCE%202021%20%F0%9F%94%A5%20_%20XO%20TEAM%20TikTok%20%23dance%20%23xoteam%20%23tiktok.mp4",
    "https://github.com/raghav042/feedmedia/blob/main/cherrydeck-MtHiQ8NCIoM-unsplash.jpg?raw=true",
    "https://github.com/raghav042/feedmedia/raw/main/videoplayback.mp4",
    "https://github.com/raghav042/feedmedia/raw/main/videoplayback%20(3).mp4",
    "https://github.com/raghav042/feedmedia/raw/main/videoplayback%20(2).mp4",
    "https://github.com/raghav042/feedmedia/blob/main/green.jpg?raw=true",
    "https://github.com/raghav042/feedmedia/blob/main/services-left-image.jpg?raw=true",
    "https://github.com/raghav042/feedmedia/blob/main/stationary-workplace-workspace-style-computer-concept.jpg?raw=true",
    "https://github.com/raghav042/feedmedia/raw/main/videoplayback%20(1).mp4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listUrl.length,
          itemBuilder: (_, index) {
            return HomePostCardTrial(url: listUrl[index]);
          }),
    );
  }
}
