import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/app_controller.dart';

class TabViewWidget extends StatelessWidget {
  TabViewWidget({super.key});

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appController.mTabList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(() {
            return InkWell(
              onTap: () {
                appController.changeTab(index);
              },
              child: AnimatedContainer(
                margin: EdgeInsets.fromLTRB(index == 0 ? 15 : 5, 0, 5, 0),
                width: Get.width / 3.5,
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                        index == appController.selectedIndex.value ? 15 : 9),
                  ),
                  color: index == appController.selectedIndex.value
                      ? const Color.fromARGB(255, 216, 1, 105)
                      : Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    appController.mTabList[index],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
