import 'package:projetflutter/models/class_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetflutter/models/data_source.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FeuilleContact> _contactList = DataSource.feuilleContactList;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contact_detail", arguments: {'index': null});
        },
        backgroundColor: const Color.fromARGB(223, 248, 249, 250),
        child: const Icon(
          Icons.add_rounded,
          size: 40.0,
          color: Color.fromARGB(255, 124, 140, 153),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 230, 237, 245),
        title: const Center(
          child: Text(
            'Porjet flutter !!',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 28),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(223, 223, 230, 237),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            _contactList.length,
            (index) => Block(
                name: (_contactList[index].firstName ?? "Non renseigné") +
                    ' ' +
                    (_contactList[index].lastName ?? "Non renseigné"),
                phoneNumber:
                    _contactList[index].personalPhoneNumber ?? "Non renseigné",
                mail: _contactList[index].mail ?? "Non renseigné"),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(height: 1, fontSize: 25),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.local_phone_rounded),
                            Text(
                              '  ' + phoneNumber,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75),
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.mail_rounded),
                            Text(
                              '  ' + mail,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75),
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Icon(Icons.more_horiz_outlined,
                            color: Color.fromARGB(255, 0, 0, 0), size: 36.0),
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
