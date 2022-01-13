import 'package:projetflutter/view/contact_page/models/feuille_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const contact(feuilleContactList: [],));
}

// ignore: camel_case_types
class contact extends StatelessWidget {
  final List<FeuilleContact> feuilleContactList;
  
  const contact({
    Key? key,
    required this.feuilleContactList
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FeuilleContact> feuilleContactList = <FeuilleContact>[
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net"),
      FeuilleContact(
          name: "Jean-Paul Larue",
          phoneNumber: "06 71 59 57 60",
          mail: "jp.larue@laposte.net")
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        feuilleContactList.add(FeuilleContact(name: "Ajouté", phoneNumber: "XX1", mail: "x@f.x"));
      }),

      appBar: AppBar(
          backgroundColor: const Color.fromARGB(223, 230, 237, 245),
          title: const Text('Porjet flutter !!',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold))),
                  
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            feuilleContactList.length,
            (index) => Block(
              name: feuilleContactList[index].name,
              phoneNumber: feuilleContactList[index].phoneNumber,
              mail: feuilleContactList[index].mail
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Block extends StatelessWidget {
  String name, phoneNumber, mail;

  Block({Key? key, required this.name, required this.phoneNumber, required this.mail})
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(name),
                    Text(phoneNumber),
                    Text(mail)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Icon(
                          Icons.dehaze_rounded,
                          color: Colors.blue,
                          size: 36.0,
                        ),
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
