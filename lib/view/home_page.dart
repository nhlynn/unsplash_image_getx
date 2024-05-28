import 'package:flutter/material.dart';
import '../widget/header_view_widget.dart';
import '../widget/image_list_view_widget.dart';
import '../widget/tab_view_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 3,
              child: HeaderViewWidget(),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: TabViewWidget(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    flex: 16,
                    child: ImageListViewWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
