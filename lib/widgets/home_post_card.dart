import 'package:visibility_detector/visibility_detector.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:video_player/video_player.dart';

class HomePostCard extends StatelessWidget {
  final String profilePicUrl;
  final String userPostUrl;
  final String userName;
  const HomePostCard({
    Key? key,
    required this.profilePicUrl,
    required this.userPostUrl,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 5),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    profilePicUrl,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Dec 19, 2022',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
                image: DecorationImage(
                    image: NetworkImage(userPostUrl), fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            // child: Image.network(
            //   userPostUrl,
            //   fit: BoxFit.cover,
            // ),
          ),
        ],
      ),
    );
  }
}

class HomePostCardTrial extends StatefulWidget {
  const HomePostCardTrial({super.key, required this.url});
  final String url;

  @override
  State<HomePostCardTrial> createState() => _HomePostCardTrialState();
}

class _HomePostCardTrialState extends State<HomePostCardTrial> {
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

  // TODO: uncomment below code to dispose video
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
    if (videoPlayerController != null && isInitialized == true) {
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

enum UrlType { image, video, unknown }

enum VisibilityStatus {
  notVisible,
  partiallyVisible,
  fullyVisible,
}

class UrlTypeHelper {
  static const List<String> _imageTypes = [
    'jpg',
    'jpeg',
    'jfif',
    'pjpeg',
    'pjp',
    'png',
    'svg',
    'gif',
    'apng',
    'webp',
    'avif'
  ];
  static const List<String> _videoTypes = [
    "3g2",
    "3gp",
    "aaf",
    "asf",
    "avchd",
    "avi",
    "drc",
    "flv",
    "m2v",
    "m3u8",
    "m4p",
    "m4v",
    "mkv",
    "mng",
    "mov",
    "mp2",
    "mp4",
    "mpe",
    "mpeg",
    "mpg",
    "mpv",
    "mxf",
    "nsv",
    "ogg",
    "ogv",
    "qt",
    "rm",
    "rmvb",
    "roq",
    "svi",
    "vob",
    "webm",
    "wmv",
    "yuv"
  ];

  static UrlType getType(url) {
    Uri uri = Uri.parse(url);
    String extension = p.extension(uri.path).toLowerCase().split('.').last;
    if (extension.isEmpty) {
      return UrlType.unknown;
    } else if (_imageTypes.contains(extension)) {
      return UrlType.image;
    } else if (_videoTypes.contains(extension)) {
      return UrlType.video;
    } else {
      return UrlType.unknown;
    }
  }
}
