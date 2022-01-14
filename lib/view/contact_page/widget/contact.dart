import 'package:projetflutter/models/class_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(contact(
    feuilleContactList: [],
  ));
}

// ignore: camel_case_types
class contact extends StatelessWidget {
  List<FeuilleContact> feuilleContactList;

  contact({Key? key, required this.feuilleContactList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed("/contact_detail", arguments: {
          'feuilleContactList': feuilleContactList,
          'index': null
        });
      }),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(223, 230, 237, 245),
          title: const Text('Porjet flutter !!',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            feuilleContactList.length,
            (index) => Block(
                name: (feuilleContactList[index].firstName ?? "Non renseigné") +
                    ' ' +
                    (feuilleContactList[index].lastName ?? "Non renseigné"),
                phoneNumber: feuilleContactList[index].personalPhoneNumber ??
                    "Non renseigné",
                mail: feuilleContactList[index].mail ?? "Non renseigné"),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Block extends StatelessWidget {
  String name, phoneNumber, mail;

  Block(
      {Key? key,
      required this.name,
      required this.phoneNumber,
      required this.mail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(name),
                        ),
                        ListTile(
                          subtitle: Text('\u{1F4DE} ' + phoneNumber),
                        ),
                        ListTile(
                          subtitle: Text('\u{2709} ' + mail),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Icon(Icons.dehaze_rounded,
                            color: Colors.blue, size: 36.0),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
