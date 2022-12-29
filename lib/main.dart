import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/pages/principal/principal_page.dart';
import 'package:task_manager/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      initialRoute: "/home",
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xffFAFAFA),
        appBarTheme: const AppBarTheme(
          color: Color(0xffFAFAFA),
        ),
      ),
      getPages: RouterGet.routesGet(),
    );
  }
}
