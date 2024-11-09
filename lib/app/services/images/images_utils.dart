// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class ImagesUtils {
  //create singleton
  static final ImagesUtils _instance = ImagesUtils._internal();
  factory ImagesUtils() => _instance;
  ImagesUtils._internal();

  Future<String?> download(String url) async {
    final dio.Response response = await dio.Dio().get(
      url,
      options: dio.Options(
        headers: {
          HttpHeaders.acceptHeader: 'image/*',
          HttpHeaders.connectionHeader: 'keep-alive',
        },
        responseType: dio.ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) < 500;
        },
      ),
      
    );

    final imageName = path.basename(url);
    final Directory appDir =
        await path_provider.getApplicationDocumentsDirectory();
    final String localPath = path.join(appDir.path, imageName);
    final File imageFile = File(localPath);
    final raf = imageFile.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return localPath;
  }

  String getBase64FormateFile(String path) {
    if (path.isEmpty) {
      return '';
    }
    final File file = File(path);
    final List<int> fileInByte = file.readAsBytesSync();
    final String fileInBase64 = base64Encode(
      fileInByte,
    );
    return fileInBase64;
  }
}
