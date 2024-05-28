import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';

class ErrorViewWidget extends StatelessWidget {
  ErrorViewWidget({super.key});

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Obx(() => Text(
              '${appController.errorMessage}',
              style: Theme.of(context).textTheme.titleMedium,
            )),
        const SizedBox(
          height: 12,
        ),
        FilledButton(
          onPressed: appController.getImageList,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
