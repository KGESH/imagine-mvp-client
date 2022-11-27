import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/image_model.dart';
import '../providers/image_provider.dart';

class GeneratedImageWrapper extends StatelessWidget {
  final GeneratedImage image;
  final VoidCallback onTapImage;

  GeneratedImageWrapper(
      {Key? key, required this.image, required this.onTapImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            child: GestureDetector(
              onTap: onTapImage,
              child: Image.network(
                image.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
