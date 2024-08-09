import 'package:flutter/material.dart';
import 'package:todoapp/features/splash_screen/views/splash_view.dart';

import 'constans.dart';

void main() {
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
       SplashView.id:(context)=>const SplashView()
      },
    );
  }
}
