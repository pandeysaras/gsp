import 'package:gujarati_samaj_paris/widgets/player/url_type_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FeedTile2 extends StatefulWidget {
  const FeedTile2({super.key, required this.url});
  final String url;

  @override
  State<FeedTile2> createState() => _FeedTile2State();
}

class _FeedTile2State extends State<FeedTile2> {
  VideoPlayerController? videoPlayerController;
  bool isVideo = false;
  bool isPlaying = false;
  double progress = 0.0;

  @override
  void initState() {
    checkUrlType(widget.url);
    initVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: isVideo ? buildVideo() : buildImage(),
    );
  }

  Widget buildImage() {
    return CachedNetworkImage(imageUrl: widget.url);
  }

  Widget buildVideo() {
    return videoPlayerController != null
        ? GestureDetector(
            onTap: () {
              handlePlayPause();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    AspectRatio(
                      aspectRatio: videoPlayerController!.value.aspectRatio,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: VideoPlayer(videoPlayerController!),
                      ),
                    ),
                    Center(
                      child: isPlaying
                          ? const SizedBox()
                          : const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white60,
                              size: 200,
                            ),
                    )
                  ],
                ),
                LinearProgressIndicator(
                  value: progress,
                  color: Colors.red,
                )
              ],
            ),
          )
        : Container(
            height: 600,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
          );
  }

  void checkUrlType(String url) {
    if (UrlTypeHelper.getType(url) == UrlType.image) {
      setState(() {
        isVideo = false;
      });
    } else if (UrlTypeHelper.getType(url) == UrlType.video) {
      setState(() {
        isVideo = true;
      });
    }
  }

  void initVideoPlayer() {
    if (isVideo == true) {
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.url));
      videoPlayerController!.initialize().then((value) => setState(() {}));
      videoPlayerController!.play();

      setState(() {
        isPlaying = true;
      });
      updateVideoProgress();
    }
  }

  void handlePlayPause() {
    if (videoPlayerController != null) {
      setState(() {
        videoPlayerController!.value.isPlaying
            ? {
                videoPlayerController!.pause(),
                isPlaying = false,
              }
            : {
                videoPlayerController!.play(),
                isPlaying = true,
              };
      });
    }
  }

  void updateVideoProgress() {
    if (videoPlayerController != null && videoPlayerController!.value.duration.inMilliseconds != 0) {
      videoPlayerController!.addListener(() {
        setState(() {
          progress = videoPlayerController!.value.position.inMilliseconds /
              videoPlayerController!.value.duration.inMilliseconds;
        });
      });
    }
  }
}
