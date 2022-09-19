import 'package:adn_training/services/notificar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Noti extends StatefulWidget {
  const Noti({Key? key}) : super(key: key);

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  void initState() {
    Provider.of<Notificar>(context, listen: false).inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle estilo1 = ElevatedButton.styleFrom(
        primary: Colors.red,
        textStyle: const TextStyle(fontSize: 15, fontFamily: "comicsans"));
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
            child: Consumer<Notificar>(
          builder: (context, model, _) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: []),
        )));
  }
}
