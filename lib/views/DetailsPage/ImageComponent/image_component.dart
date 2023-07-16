import 'package:flutter/material.dart';
import 'package:pet_adoption/views/ZoomableImage/zoomable_image.dart';

class ImageComponent extends StatelessWidget {
  final String imageUrl;

  const ImageComponent({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ZoomableImageComponent(imageUrl: imageUrl),
          ),
        );
      },
      child: Align(
        alignment: const AlignmentDirectional(0, -1),
        child: Image.network(
          imageUrl,
          width: double.infinity,
          height: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
