import 'package:projetflutter/models/class_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(contact(
    feuilleContactList: [],
  ));
}

// ignore: camel_case_types, must_be_immutable
class contact extends StatelessWidget {
  List<FeuilleContact> feuilleContactList;

  contact({Key? key, required this.feuilleContactList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          feuilleContactList.add(
            FeuilleContact(lastName: "Ajouté", personalPhoneNumber: "XX1", mail: "x@f.x")
          );
        },
        backgroundColor: const Color.fromARGB(255, 195, 207, 217),
        child: const Icon(Icons.add_rounded, size: 40.0, color: Color.fromARGB(255, 124, 140, 153),),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 230, 237, 245),
        title: const Center(
          child: Text(
            'Porjet flutter !!',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 28
            ),
          ),
        ),
      ),
      
      backgroundColor: const Color.fromARGB(223, 223, 230, 237),
      body: SingleChildScrollView(
        child: Column(
          children: 
          List.generate(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name, 
                          style: const TextStyle(
                            height: 1,
                            fontSize: 25
                          ),
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
                                fontSize: 16
                              ),
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
                                fontSize: 16
                              ),
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
                        child: const Icon(
                          Icons.more_horiz_outlined,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 36.0
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
