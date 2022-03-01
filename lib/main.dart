import 'package:chimpanzee_game/binding/init_binding.dart';
import 'package:chimpanzee_game/helper/firebase_options.dart';
import 'package:chimpanzee_game/page/detail.dart';
import 'package:chimpanzee_game/page/home.dart';
import 'package:chimpanzee_game/page/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'chimpanzee game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
        ),
        GetPage(
          name: '/detail',
          page: () => Detail(),
        ),
        GetPage(
          name: '/setting',
          page: () => Setting(),
        ),
      ],
    );
  }
}
