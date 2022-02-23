import 'package:chimpanzee_game/binding/detail_binding.dart';
import 'package:chimpanzee_game/page/detail.dart';
import 'package:chimpanzee_game/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      ),
      initialBinding: DetailBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(
          name: '/detail',
          page: () => Detail(),
        )
      ],
    );
  }
}
