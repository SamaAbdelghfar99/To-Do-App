import 'package:flutter/material.dart';
import 'package:todoapp/features/splash_screen/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String id='splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SplashViewBody(),
    );
  }
}
