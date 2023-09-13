import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// OBTENER PERSONAS
Future<List> getPeople() async {
  List people = [];
  QuerySnapshot querySnapshot = await db.collection("Tarea").get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {"nombre": data['nombre'], "uid": doc.id};
    people.add(person);
  }

  await Future.delayed(const Duration(seconds: 2));

  return people;
}

// AGERGAR PERSONA
Future<void> addPeople(String nombre) async {
  await db.collection("Tarea").add({"nombre": nombre});
}

// ACTUALIZAR
Future<void> updatePeople(String uid, String newnombre) async {
  await db.collection("Tarea").doc(uid).set({"nombre": newnombre});
}

// ELIMINAR
Future<void> deletePeople(String uid) async {
  await db.collection("Tarea").doc(uid).delete();
}
