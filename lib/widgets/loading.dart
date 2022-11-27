import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBox extends StatelessWidget {
  const LoadingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.deepOrangeAccent,
      child: SpinKitCubeGrid(
        size: 150,
        color: Colors.white,
      ),
    );
  }
}
