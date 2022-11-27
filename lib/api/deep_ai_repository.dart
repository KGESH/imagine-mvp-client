import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/image_model.dart';

class DeepAiRepository {
  final apiClient = http.Client();

  Future<GeneratedImage> _requestImage(String prompt) async {
    const url = 'http://localhost:3000/image/deep-ai/1';
    final res = await apiClient.post(
      Uri.parse(url),
      body: <String, String>{
        'prompt': prompt,
      },
    );
    print(res.statusCode);

    if (res.statusCode >= 400) {
      throw Exception('Generate Image Fail!');
    }

    return GeneratedImage.fromJson(jsonDecode(res.body));
  }

  Future<GeneratedImage> generateImage(String prompt) async {
    return Future.delayed(const Duration(seconds: 3), () {
      return GeneratedImage(
          id: 'id',
          imageUrl:
              'https://www.flutterbeads.com/wp-content/uploads/2022/04/flutter-circular-progress-indicator-color-1024x697.png');
    });

    return GeneratedImage(
        id: 'asdf',
        imageUrl:
            'https://www.flutterbeads.com/wp-content/uploads/2022/04/flutter-circular-progress-indicator-color-1024x697.png');
    print('prompt: $prompt');
    return _requestImage(prompt);

    //
    // return Future.delayed(Duration(seconds: 3), () {
    //   print('Mock Image gen done!');
    //
    //   return GeneratedImage(
    //     id: 'generated-id',
    //     // imageUrl: 'https://file.okky.kr/images/1575278568138.PNG',
    //     imageUrl: 'https://file.okky.kr/images/1575278568138.PNG',
    //   );
    // });
  }
}
