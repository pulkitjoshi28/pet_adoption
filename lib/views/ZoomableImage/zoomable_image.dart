import 'package:flutter/material.dart';

class ZoomableImageComponent extends StatelessWidget {
  final String imageUrl;

  const ZoomableImageComponent({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: InteractiveViewer(
            panEnabled: false,
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 0.5,
            maxScale: 2.5,
            child: Image.network(imageUrl),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
