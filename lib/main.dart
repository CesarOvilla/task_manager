import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/initservice.dart';
import 'package:task_manager/routes/routes.dart';
import 'package:task_manager/utils/color_app.dart';

void main() async {
  await initServices();
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
        scaffoldBackgroundColor: ColorApp.scaffoldBackground,
        appBarTheme:  AppBarTheme(
          color: ColorApp.appBarBackgroud,
        ),
      ),
      getPages: RouterGet.routesGet(),
    );
  }
}
