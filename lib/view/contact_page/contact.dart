import 'package:flutter/material.dart';

void main() {
  runApp(const contact());
}

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Porjet flutter !!'),
        ),
        body: Container(child: Text("contact")));
  }
}
