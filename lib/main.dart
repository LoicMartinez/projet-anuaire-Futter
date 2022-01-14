import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:projetflutter/models/class_contact.dart';
import 'package:get/get.dart';

import 'view/contact_detail_page/contactDetail.dart';
import 'view/contact_page/widget/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/contact",
      getPages: [
        GetPage(
          name: "/contact",
          page: () => Contact(),
        ),
        GetPage(
          name: "/contact_detail",
          page: () => ContactDetail(),
        ),
      ],
    );
  }
}
