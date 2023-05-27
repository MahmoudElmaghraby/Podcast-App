import 'package:flutter/material.dart';
import 'package:podcast_app/modules/onBoarding/onBoarding_screen.dart';
import 'package:podcast_app/shared/components/components.dart';
import 'package:podcast_app/shared/styles/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(lightColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
