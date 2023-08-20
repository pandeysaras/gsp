import 'package:path/path.dart' as p;

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
enum UrlType { image, video, unknown }