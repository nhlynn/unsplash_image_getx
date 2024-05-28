import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controller/app_controller.dart';
import 'error_view_widget.dart';
import 'image_view_widget.dart';

class ImageListViewWidget extends StatelessWidget {
  ImageListViewWidget({super.key});

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => appController.isLoading.value
          ? Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.greenAccent,
                rightDotColor: Colors.blueGrey,
                size: 30,
              ),
            )
          : appController.errorMessage.value.isEmpty
              ? GridView.custom(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.same,
                    pattern: const [
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                      childCount: appController.photosList.length,
                      (context, index) {
                    var imageModel = appController.photosList[index];
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailPage(
                        //       imageResult: imageModel,
                        //     ),
                        //   ),
                        // );

                        Get.toNamed(
                          '/image_detail',
                          arguments: imageModel,
                        );
                      },
                      child: ImageViewWidget(
                        imageUrl: imageModel.urls?.regular ?? "",
                      ),
                    );
                  }),
                )
              : ErrorViewWidget(),
    );
  }
}
