import 'dart:io';

import 'package:adn_training/views/Login/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class terminosCondiciones extends StatelessWidget {
  terminosCondiciones({
    Key? key,
    this.radius = 16,
    required this.mdFileName,
  })  : assert(mdFileName.contains('.md'),
            'el archivo debe contener un .md extension'),
        super(key: key);
  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(radius)),
        child: Column(
          children: [
            SizedBox(height: 8),
            Image.asset(
              'assets/imagenes/iconnoti.png',
              width: 120,
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 247, 243, 243)),
                child: FutureBuilder(
                  future:
                      Future.delayed(Duration(milliseconds: 150)).then((value) {
                    return rootBundle.loadString('assets/imagenes/$mdFileName');
                  }),
                  builder: (context, snapshot) {
                    var style = MarkdownStyleSheet(
                      textAlign: WrapAlignment.center,
                    );
                    if (snapshot.hasData) {
                      return Markdown(
                        data: snapshot.data as String,
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Wrap(children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Color.fromRGBO(241, 123, 50, 1)),
                    ),
                  ),
                ),
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                },
              ),
              SizedBox(width: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(241, 123, 50, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      "Aceptar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
              ),
            ]),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
