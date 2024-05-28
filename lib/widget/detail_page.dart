import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../data/model/image_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ImageResult imageResult = Get.arguments;
    debugPrint(imageResult.createdAt);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: imageResult.urls?.full ?? "",
          placeholder: (context, url) => Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: Colors.greenAccent,
              rightDotColor: Colors.blueGrey,
              size: 30,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey,
            ),
          ),
          imageBuilder: (context, imageProvider) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Text(
                  imageResult.createdAt ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
