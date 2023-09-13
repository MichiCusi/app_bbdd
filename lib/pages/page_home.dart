import 'package:app_bbdd/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programador de tareas'),
      ),
      body: FutureBuilder(
          future: getPeople(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      onDismissed: (direction) async {
                        await deletePeople(snapshot.data?[index]['uid']);
                        snapshot.data?.removeAt(index);
                      },
                      confirmDismiss: (direction) async {
                        bool result = false;

                        result = await showDialog(
                            // dialogo de confirmacion de eliminacion
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "Estas seguro de eliminar a ${snapshot.data?[index]['nombre']}"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(context, false);
                                      },
                                      child: const Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(context, true);
                                      },
                                      child: const Text("Aceptar")),
                                ],
                              );
                            });
                        return result;
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      direction: DismissDirection
                          .endToStart, // solo se podra deslizar del ldo derecha a izquierda
                      key: Key(snapshot.data?[index]['uid']), // llave unica
                      child: ListTile(
                        title: Text(snapshot.data?[index]['nombre']),
                        onTap: () async {
                          await Navigator.pushNamed(context, '/edit',
                              arguments: {
                                "nombre": snapshot.data?[index]['nombre'],
                                "uid": snapshot.data?[index]['uid']
                              });
                          setState(() {});
                        },
                      ));
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
