// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'terminosCondiciones.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({Key? key}) : super(key: key);

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 5), () {
      print("ya puede pasar");

      showDialog(
          context: context,
          builder: (context) {
            return terminosCondiciones(mdFileName: 'terms_and_conditions.md');
          });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => _isLoading
      ? Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(32, 71, 160, 1),
              Color.fromRGBO(38, 201, 199, 1)
            ],
            stops: [0.2, 0.9],
            begin: Alignment(-1.0, -1),
            end: Alignment(-1.0, 1),
          )),
          child: const Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
          ),
        )
      : Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(32, 71, 160, 1),
              Color.fromRGBO(38, 201, 199, 1)
            ],
            stops: [0.2, 0.9],
            begin: Alignment(-1.0, -1),
            end: Alignment(-1.0, 1),
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                SizedBox(height: 32.0),
                Image.asset(
                  'assets/imagenes/iconnoti.png',
                  width: 150,
                ),
                SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(241, 123, 50, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Reintentar"),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/Login",
                        );
                      }),
                )
                //terminosCondiciones(mdFileName: 'terms_and_conditions.md'),
              ],
            ),
          ),
        );
}
