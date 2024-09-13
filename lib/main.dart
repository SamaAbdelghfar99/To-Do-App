import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/features/home_Screen/views/taps/edit_task_screen.dart';
import 'package:todoapp/features/splash_screen/views/splash_view.dart';

import 'constans.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
     initialRoute: SplashView.id,
      routes: {
       SplashView.id:(context)=>const SplashView(),
        EditTaskScreen.iD:(context)=> EditTaskScreen(),

      },
    );
  }
}
