import 'package:flutter/material.dart';
import 'package:projetflutter/models/class_contact.dart';

void main() {
  runApp(contactDetail(
    contactList: [],
  ));
}

class contactDetail extends StatelessWidget {
  List<FeuilleContact>? contactList;
  int? index;
  contactDetail({Key? key, this.contactList, this.index})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.all(8.0),
                    child: information(
                      contact: "salut"
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Coordones(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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
  String? contact;
  information({Key? key, this.contact}) : super(key: key);

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
                      initialValue: (contact) ?? '',
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
                        }),
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
                  }),
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Coordones extends StatelessWidget {
  const Coordones({Key? key}) : super(key: key);

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
                }),
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
                }),
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
                }),
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
                }),
          ),
        ],
      ),
    ));
  }
}
