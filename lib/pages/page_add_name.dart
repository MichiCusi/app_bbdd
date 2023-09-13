import 'package:app_bbdd/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  TextEditingController nameCOntroller = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ADD TAREA')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameCOntroller,
              decoration: const InputDecoration(hintText: 'Enter tarea'),
            ),
            ElevatedButton(
                onPressed: () async {
                  addPeople(nameCOntroller.text).then((_) {
                    Navigator.pop(
                        context); // regresa a la ventan anterior elmiminando la actual
                  });
                },
                child: const Text("GUARDAR"))
          ],
        ),
      ),
    );
  }
}
