import 'package:flutter/material.dart';
import 'models/class_contact.dart';
import 'package:get/get.dart';

import 'view/contact_detail_page/contact_detail.dart';
import 'view/contact_page/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/contact_detail",
      getPages: [
        GetPage(name: "/contact", page: () => const contact()),
        GetPage(name: "/contact_detail", page: () => ContactDetail())
      ],
    );
  }
}
