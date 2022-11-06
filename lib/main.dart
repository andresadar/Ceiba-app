import 'dart:io';

import 'package:ceiba_app/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'data/models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Inicializar Hive (Database)
  var path = Directory.current.path;
  Hive
    ..init(path)
    ..registerAdapter(UserModelAdapter());

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceiba App',
      initialRoute: AppRoutes.users,
      routes: AppRoutes.routes,
    );
  }
}
