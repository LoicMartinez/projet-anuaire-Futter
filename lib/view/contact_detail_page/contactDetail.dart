import 'package:flutter/material.dart';
import 'package:projetflutter/models/class_contact.dart';
import 'package:get/get.dart';

class ContactDetail extends StatelessWidget {
  List<FeuilleContact> contactList;
  int? index;
  ContactDetail({Key? key, required this.contactList, this.index})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();
  dynamic info = {
    "lastName": '',
    "firstName": '',
    "socity": '',
    "job": '',
    "personalPhoneNumber": '',
    "proPhoneNumber": '',
    "fixPhoneNumber": '',
    "mail": ''
  }.obs;

  @override
  Widget build(BuildContext context) {
    contactList = Get.arguments['feuilleContactList'];
    index = Get.arguments['index'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 230, 237, 245),
        title: const Text(
          'Prénom Nom',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: information(
                        contact: index != null
                            ? contactList[index!]
                            : FeuilleContact(),
                        info: info),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Coordones(
                      info: info,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (index != null) {
                        contactList[index!].lastName = "lastName";
                      } else {
                        FeuilleContact newContact = FeuilleContact(
                            lastName: info["lastName"],
                            firstName: info["firstName"],
                            socity: info["socity"],
                            job: info["lastName"],
                            personalPhoneNumber: info["personalPhoneNumber"],
                            proPhoneNumber: info["proPhoneNumber"],
                            fixPhoneNumber: info["fixPhoneNumber"],
                            mail: info["mail"]);
                        contactList.add(newContact);
                      }
                      Get.toNamed("/contact", arguments: contactList);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class information extends StatelessWidget {
  FeuilleContact? contact;
  dynamic info;
  information({Key? key, this.contact, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Informations",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: contact?.firstName ?? '',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nom',
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                      style: const TextStyle(
                        fontSize: 10.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                      onChanged: (value) {
                        info["firstName"] = value;
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Prénom',
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                      style: const TextStyle(
                        fontSize: 10.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                      onChanged: (value) {
                        info["lastName"] = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Société',
                  hintStyle: TextStyle(fontSize: 15),
                ),
                style: const TextStyle(
                  fontSize: 10.0,
                  height: 1.0,
                  color: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                onChanged: (value) {
                  info["socity"] = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Poste',
                  hintStyle: TextStyle(fontSize: 15),
                ),
                style: const TextStyle(
                  fontSize: 10.0,
                  height: 1.0,
                  color: Colors.black,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                onChanged: (value) {
                  info["job"] = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Coordones extends StatelessWidget {
  FeuilleContact? contact;
  dynamic info;
  Coordones({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Téléphone',
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(Icons.done),
              ),
              style: const TextStyle(
                fontSize: 10.0,
                height: 1.0,
                color: Colors.black,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onChanged: (value) {
                info["personalPhoneNumber"] = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Téléphone portable',
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(Icons.done),
              ),
              style: const TextStyle(
                fontSize: 10.0,
                height: 1.0,
                color: Colors.black,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onChanged: (value) {
                info["proPhoneNumber"] = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Téléphone fixe',
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(Icons.done),
              ),
              style: const TextStyle(
                fontSize: 10.0,
                height: 1.0,
                color: Colors.black,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onChanged: (value) {
                info["fixPhoneNumber"] = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E-mail',
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(Icons.done),
              ),
              style: const TextStyle(
                fontSize: 10.0,
                height: 1.0,
                color: Colors.black,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              onChanged: (value) {
                info["mail"] = value;
              },
            ),
          ),
        ],
      ),
    ));
  }
}
