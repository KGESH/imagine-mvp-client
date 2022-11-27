import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final inputController = TextEditingController();
  final Function(String) onSubmit;

  SearchBar({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: inputController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Hint here!',
            ),
          ),
          TextButton(
            onPressed: () => onSubmit(inputController.text),
            child: Text('이미지 생성'),
          )
        ],
      ),
    );
  }
}
