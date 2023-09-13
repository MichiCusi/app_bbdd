import 'package:app_bbdd/services/firebase_services.dart';
import 'package:flutter/material.dart';

class EditName extends StatefulWidget {
  const EditName({super.key});

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  TextEditingController nameCOntroller = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments
        as Map; // esto manda el nombre pae=ra ser editado
    nameCOntroller.text = arguments['nombre'];

    return Scaffold(
      appBar: AppBar(title: const Text('EDITAR TAREA')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameCOntroller,
              decoration: const InputDecoration(hintText: 'Change tarea'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await updatePeople(arguments['uid'], nameCOntroller.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("GUARDAR"))
          ],
        ),
      ),
    );
  }
}
