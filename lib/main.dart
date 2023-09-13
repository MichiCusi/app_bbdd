import 'package:app_bbdd/pages/page_add_name.dart';
import 'package:app_bbdd/pages/page_edit_name.dart';
import 'package:app_bbdd/pages/page_home.dart';
//import 'package:app_bbdd/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// COMENTARIO 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddName(),
        '/edit': (context) => const EditName(),
      },
    );
  }
}
