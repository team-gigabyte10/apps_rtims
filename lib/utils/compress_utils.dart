import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';

class CompressUtils {
  static Future<String?> compressVideo(path) async {
    final file = File(path);
    await VideoCompress.setLogLevel(0);
    final info = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: true,
      includeAudio: true,
    );
    print(info?.path);
    print(info?.filesize);
    return info?.path;
  }

  static Future<File?> compressImageAndGetFile(
      File file, String targetPath) async {
    print('testCompressAndGetFile');
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 90,
      minWidth: 1024,
      minHeight: 1024,
      rotate: 90,
    );
    print(file.lengthSync());
    print(result?.lengthSync());
    return result;
  }
}
