import 'package:flutter/foundation.dart';
import 'package:mvp_app/api/deep_ai_repository.dart';
import 'package:mvp_app/models/image_model.dart';

class ImageGenerateProvider with ChangeNotifier {
  final DeepAiRepository _deepAiRepository = DeepAiRepository();
  bool loading = false;
  late GeneratedImage _generatedImage;
  GeneratedImage get generatedImage => _generatedImage;

  generateImage(String prompt) async {
    loading = true;
    _generatedImage = await _deepAiRepository.generateImage(prompt);
    loading = false;
    notifyListeners();
  }
}
