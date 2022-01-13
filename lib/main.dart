import 'package:flutter/material.dart';
import 'package:projetflutter/models/class_contact.dart';
import 'package:get/get.dart';

import 'view/contact_detail_page/contactDetail.dart';
import 'view/contact_page/widget/contact.dart';

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
        GetPage(
            name: "/contact",
            page: () => const contact(
                  feuilleContactList: [],
                )),
        GetPage(
            name: "/contact_detail",
            page: () => contactDetail(
                  contactList: [],
                ))
      ],
    );
  }
}
