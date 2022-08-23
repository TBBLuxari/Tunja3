// ignore_for_file: unused_import
import 'package:adn_training/services/notificar.dart';
import 'package:adn_training/views/Login/login.dart';
import 'package:adn_training/views/home/home.dart';
import 'package:adn_training/views/notificaciones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Notificar())],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Monteserat'),
          home: const Login(),
        ));
  }
}
