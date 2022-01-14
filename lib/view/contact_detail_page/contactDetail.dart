import 'package:flutter/material.dart';
import 'package:projetflutter/models/class_contact.dart';
import 'package:get/get.dart';
import 'package:projetflutter/models/data_source.dart';

class ContactDetail extends StatelessWidget {
  int? index;
  ContactDetail({Key? key, this.index}) : super(key: key);

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
    List<FeuilleContact> _contactList = DataSource.feuilleContactList;
    _contactList[0].firstName;
    index = Get.arguments['index'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 230, 237, 245),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Prénom Nom',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                formValidator(_formKey, index, info, _contactList, context);
              },
              child: const Icon(
                Icons.check_circle_outlined,
                color: Color.fromARGB(223, 89, 191, 185),
                size: 40,
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(223, 223, 230, 237),
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
                    child: Information(
                        contact: index != null
                            ? _contactList[index!]
                            : FeuilleContact(),
                        info: info),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Coordones(
                      contact: index != null
                          ? _contactList[index!]
                          : FeuilleContact(),
                      info: info,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Information extends StatelessWidget {
  FeuilleContact? contact;
  dynamic info;
  Information({Key? key, this.contact, required this.info}) : super(key: key);

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
                SplitTextFormField(
                  hint: "Nom",
                  isValidator: true,
                  info: info,
                  infoIndex: "firstName",
                  initialValue: contact?.firstName ?? '',
                ),
                SplitTextFormField(
                  hint: "Prénom",
                  isValidator: true,
                  info: info,
                  infoIndex: "lastName",
                  initialValue: contact?.lastName ?? '',
                ),
              ],
            ),
            FullTextFormField(
              hint: "Société",
              isValidator: false,
              info: info,
              infoIndex: "socity",
              initialValue: contact?.socity ?? '',
            ),
            FullTextFormField(
              hint: "Poste",
              isValidator: false,
              info: info,
              infoIndex: "job",
              initialValue: contact?.job ?? '',
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
  Coordones({Key? key, this.contact, required this.info}) : super(key: key);

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
            ),
          ),
          FullTextFormField(
            hint: "Téléphone",
            iconField: const Icon(Icons.smartphone_outlined),
            isValidator: true,
            info: info,
            infoIndex: "personalPhoneNumber",
            initialValue: contact?.personalPhoneNumber ?? '',
          ),
          FullTextFormField(
            hint: "Téléphone portable pro",
            iconField: const Icon(Icons.phone),
            isValidator: false,
            info: info,
            infoIndex: "proPhoneNumber",
            initialValue: contact?.proPhoneNumber ?? '',
          ),
          FullTextFormField(
            hint: "Téléphone fixe",
            iconField: const Icon(Icons.phone),
            isValidator: false,
            info: info,
            infoIndex: "fixPhoneNumber",
            initialValue: contact?.fixPhoneNumber ?? '',
          ),
          FullTextFormField(
            hint: "E-mail",
            iconField: const Icon(Icons.email_outlined),
            isValidator: true,
            info: info,
            infoIndex: "mail",
            initialValue: contact?.mail ?? '',
          ),
        ],
      ),
    ));
  }
}

class FullTextFormField extends StatelessWidget {
  String hint, initialValue, infoIndex;
  dynamic info;
  Icon? iconField;
  bool isValidator;
  FullTextFormField(
      {Key? key,
      required this.hint,
      this.iconField,
      required this.isValidator,
      required this.info,
      required this.infoIndex,
      required this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 15),
          prefixIcon: iconField,
        ),
        style: const TextStyle(
          fontSize: 15.0,
          height: 1.0,
          color: Colors.black,
        ),
        validator: (value) {
          if (isValidator && (value == null || value.isEmpty)) {
            return 'Please enter some text';
          }
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            info[infoIndex] = value;
          }
        },
      ),
    );
  }
}

class SplitTextFormField extends StatelessWidget {
  String hint, initialValue, infoIndex;
  dynamic info;
  Icon? iconField;
  bool isValidator;
  SplitTextFormField(
      {Key? key,
      required this.hint,
      this.iconField,
      required this.isValidator,
      required this.info,
      required this.infoIndex,
      required this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 15),
            prefixIcon: iconField,
          ),
          style: const TextStyle(
            fontSize: 15.0,
            height: 1.0,
            color: Colors.black,
          ),
          validator: (value) {
            if (isValidator && (value == null || value.isEmpty)) {
              return 'Please enter some text';
            }
          },
          onChanged: (value) {
            if (value.isNotEmpty) {
              info[infoIndex] = value;
            }
          },
        ),
      ),
    );
  }
}

formValidator(formKey, index, info, contactList, context) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    if (index != null) {
      info["lastName"].toString().isNotEmpty
          ? contactList[index!].lastName = info["lastName"]
          : '';
      info["firstName"].toString().isNotEmpty
          ? contactList[index!].firstName = info["firstName"]
          : '';
      info["socity"].toString().isNotEmpty
          ? contactList[index!].socity = info["socity"]
          : '';
      info["job"].toString().isNotEmpty
          ? contactList[index!].job = info["job"]
          : '';
      info["personalPhoneNumber"].toString().isNotEmpty
          ? contactList[index!].personalPhoneNumber =
              info["personalPhoneNumber"]
          : '';
      info["proPhoneNumber"].toString().isNotEmpty
          ? contactList[index!].proPhoneNumber = info["proPhoneNumber"]
          : '';
      info["fixPhoneNumber"].toString().isNotEmpty
          ? contactList[index!].fixPhoneNumber = info["fixPhoneNumber"]
          : '';
      info["mail"].toString().isNotEmpty
          ? contactList[index!].mail = info["mail"]
          : '';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('contact modifié')),
      );
    } else {
      FeuilleContact newContact = FeuilleContact(
          lastName: info["lastName"],
          firstName: info["firstName"],
          socity: info["socity"],
          job: info["job"],
          personalPhoneNumber: info["personalPhoneNumber"],
          proPhoneNumber: info["proPhoneNumber"],
          fixPhoneNumber: info["fixPhoneNumber"],
          mail: info["mail"]);
      DataSource.feuilleContactList.add(newContact);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('contact ajouté')),
      );
    }
    Get.toNamed("/contact");
  }
}
