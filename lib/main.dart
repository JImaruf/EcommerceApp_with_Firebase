import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetryflutter/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/HomeController.dart';
import 'pages/MyHomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  Get.put(HomeController());
  runApp(const MyApp());
  print("maruf");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

