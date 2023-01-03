import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/service/sharedpreference/shared_preference_servcie.dart';


Future<void> initServices() async {
  log('Starting services ...\n');
  WidgetsFlutterBinding.ensureInitialized();

  await sharedPreferences();
  initConfigMovile();
}


void initConfigMovile() {
  log('Starting Config Movile ...\n');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}


Future<void> sharedPreferences() async {
  await SharedPreferencesService.initSerivce();
}
