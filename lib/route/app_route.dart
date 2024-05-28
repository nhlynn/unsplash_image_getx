import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:intl/intl.dart';

import '../view/home_page.dart';
import '../view/detail_page.dart';

class AppRoute {
  static final routes = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/image_detail', page: () => const DetailPage()),
  ];
}

String getFormattedDate(String date) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(DateFormat('yyyy-MM-dd').parse(date));
  return formattedDate;
}
