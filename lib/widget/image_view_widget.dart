import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ImageViewWidget extends StatelessWidget {
  const ImageViewWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: LoadingAnimationWidget.flickr(
          leftDotColor: Colors.greenAccent,
          rightDotColor: Colors.blueGrey,
          size: 25,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.image_not_supported_rounded,
        color: Colors.red,
      ),
    );
  }
}
