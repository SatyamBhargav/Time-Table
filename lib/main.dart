import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'TimeTable.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TESTING',
      // home: MainPage(),
      // home: Faculty(),
      // home: ExamScreen(),
      // home: HostelScreen(),
      home: TimeTable(),
      // home: DropdownDemo(),
    );
  }
}
