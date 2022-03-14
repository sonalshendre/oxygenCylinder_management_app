import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_management_app/homepage.dart';
import 'package:oxygen_management_app/searchCustomer.dart';
import 'package:oxygen_management_app/userEntryPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(

    home: HomePage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}


