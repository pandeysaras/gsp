import 'package:gujarati_samaj_paris/widgets/player/url_type_helper.dart';
import 'package:gujarati_samaj_paris/widgets/player/visibility_status.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FeedTile1 extends StatefulWidget {
  const FeedTile1({super.key, required this.url});
  final String url;

  @override
  State<FeedTile1> createState() => _FeedTile1State();
}

class _FeedTile1State extends State<FeedTile1> {
  VideoPlayerController? videoPlayerController;
  VisibilityStatus visibilityStatus = VisibilityStatus.notVisible;
  bool isVideo = false;
  bool isInitialized = false;
  bool isPlaying = false;
  double progress = 0.0;

  @override
  void initState() {
    checkUrlType(widget.url);
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
      child: VisibilityDetector(
        key: Key(widget.url),
        child: isVideo ? buildVideo() : buildImage(),
        onVisibilityChanged: (info) {
          listenVisibility(info.visibleFraction);
          controlVPC();
        },
      ),
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

  Future<void> controlVPC() async {
    switch (visibilityStatus) {
      case VisibilityStatus.notVisible:
        {
          // TODO: your logic here
          if (videoPlayerController != null) {
            if (videoPlayerController!.value.isPlaying) {
              videoPlayerController!.pause();
            }
          }
        }
        break;
      case VisibilityStatus.partiallyVisible: // create controller
        {
          if (isInitialized == true) {
            videoPlayerController!.pause();
            setState(() {
              isPlaying = false;
            });
          } else {
            videoPlayerController =
                VideoPlayerController.networkUrl(Uri.parse(widget.url));
            videoPlayerController!.initialize().then((value) => setState(() {
                  isInitialized = true;
                  isPlaying = false;
                }));
            videoPlayerController!.pause();
          }
        }
        break;
      case VisibilityStatus.fullyVisible:
        {
          if (isInitialized == true) {
            videoPlayerController!.play();
            updateVideoProgress();
            setState(() {
              isPlaying = true;
            });
          } else {
            videoPlayerController =
                VideoPlayerController.networkUrl(Uri.parse(widget.url));
            videoPlayerController!.initialize().then((value) => setState(() {
                  isInitialized = true;
                  isPlaying = true;
                }));
            videoPlayerController!.play();
            updateVideoProgress();
          }
        }
        break;
    }
  }

  void handlePlayPause() {
    if (visibilityStatus == VisibilityStatus.fullyVisible) {
      if (videoPlayerController != null) {
        setState(() {
          videoPlayerController!.value.isPlaying
              ? {
                  videoPlayerController!.pause(),
                  isPlaying = false,
                }
              : {videoPlayerController!.play(), isPlaying = true};
        });
      }
    }
  }

  void updateVideoProgress() {
    if (videoPlayerController != null &&
        videoPlayerController!.value.duration.inMilliseconds != 0) {
      videoPlayerController!.addListener(() {
        setState(() {
          progress = videoPlayerController!.value.position.inMilliseconds /
              videoPlayerController!.value.duration.inMilliseconds;
        });
      });
    }
  }

  void listenVisibility(double visibility) {
    visibilityStatus = visibility != 0
        ? visibility > 0.5
            ? VisibilityStatus.fullyVisible
            : VisibilityStatus.partiallyVisible
        : VisibilityStatus.notVisible;
    setState(() {});
  }
}
