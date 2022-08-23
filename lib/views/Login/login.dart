// ignore_for_file: avoid_print, sort_child_properties_last, non_constant_identifier_names, unused_import, use_build_context_synchronously
import 'dart:convert';
import 'dart:isolate';
import 'dart:async';
import 'dart:math';
import 'package:adn_training/services/notificar.dart';
import 'package:adn_training/views/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//---------------------------Variable Globales App------------------------------
final correo = TextEditingController();
final contrasena = TextEditingController();

var puntosbase;
var namebase;
var topbase;

//-----------------------Notificacion Personalizada ----------------------------
var TituloNotidicacion = "Hola";
var MensajeNotificacion = "Es bueno verte otra vez";
var LinkImagenNotificacion = "";
var LinkNotificacion = "";
//-------------------------Notificaciones Agendadas ----------------------------
var TNA1;
var TNA2;
var TNA3;
var TNA4;
//--
var MNA1;
var MNA2;
var MNA3;
var MNA4;
//--
var LNA1;
var LNA2;
var LNA3;
var LNA4;

//-------------------------------URLS-------------------------------------------
final urlGetHome = Uri.parse("https://vozai.herokuapp.com/");
final urlPostRegister = Uri.parse("https://vozai.herokuapp.com/Register");
final urlPostLogin = Uri.parse("https://vozai.herokuapp.com/Login");
final urlPostProfile = Uri.parse("https://vozai.herokuapp.com/Profile");
final urlPostLogout = Uri.parse("https://vozai.herokuapp.com/Logout");
final urlPostRanking = Uri.parse("https://vozai.herokuapp.com/Ranking");
final urlPostNotificar = Uri.parse("https://vozai.herokuapp.com/Notificar");

//----------------------------CABEZERAS-----------------------------------------
final headers1 = {'Content-Type': 'application/x-www-form-urlencoded'};
//-----------------VARIABLES PARA EL  ISOLATES----------------------------------

//------------------------------------------------------------------------------
void Deamon(SendPort mySendPort) async //
{
  //Creo un puerto para escuchar lo que me mande el Main isolate
  ReceivePort ReceivePortSpawnIsolate = ReceivePort();
  //En mi sendport voy a enviar un mensaje si escucho algo en mi reciveport
  mySendPort.send(ReceivePortSpawnIsolate.sendPort);
  //Espero que llegue algun mensaje en mi recieve port
  await for (var message in ReceivePortSpawnIsolate) //
  {
    if (message is List) //
    {
      var email = message[0];
      var password = message[1];
      print(
          "Envie email == $email y contraseña == $password "); //Lo que llega del main isolate
      //---------------------------------------Peticion http-------------------------------------
      var header = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request = http.Request(
          'POST', Uri.parse('https://vozai.herokuapp.com/Notificar'));

      request.bodyFields = {'email': email, 'password': password};
      request.headers.addAll(header);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) //
      {
        var json = await response.stream.bytesToString();
        var jsn = jsonDecode(json);

        var titulo = jsn['titulo'];
        var mensaje = jsn['mensaje'];
        var link = jsn['link'];
        var tt1 = jsn['NA1']['TNA1'];
        var mt1 = jsn['NA1']['MNA1'];
        var lt1 = jsn['NA1']['LNA1'];
        var tt2 = jsn['NA2']['TNA2'];
        var mt2 = jsn['NA2']['MNA2'];
        var lt2 = jsn['NA2']['LNA2'];
        var tt3 = jsn['NA3']['TNA3'];
        var mt3 = jsn['NA3']['MNA3'];
        var lt3 = jsn['NA3']['LNA3'];
        var tt4 = jsn['NA4']['TNA4'];
        var mt4 = jsn['NA4']['MNA4'];
        var lt4 = jsn['NA4']['LNA4'];

        //agarro el puerto que me envia y meto mi respuesta ahi y se lo envio creo
        final SendPort mikeResponseSendPort = message[2];
        mikeResponseSendPort.send([
          titulo,
          mensaje,
          link,
          tt1,
          mt1,
          lt1,
          tt2,
          mt2,
          lt2,
          tt3,
          mt3,
          lt3,
          tt4,
          mt4,
          lt4,
        ]);
      } else //
      {
        print(response.reasonPhrase);
      }
    }
  }
}

//------------------------------------------------------------------------------
var noti = Notificar();

void LLamarNotificacion1() async {
  await noti.HrNotificacion1();
}

void LLamarNotificacion2() async {
  await noti.HrNotificacion2();
}

void LLamarNotificacion3() async {
  await noti.HrNotificacion3();
}

void LLamarNotificacion4() async {
  await noti.HrNotificacion4();
}

//------------------------------------------------------------------------------
//---------------------------------Login----------------------------------------
//------------------------------------------------------------------------------
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imagenes/fondo1.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 60),
                      child: Image.asset("assets/imagenes/logo.png")),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 294,
                    height: 356,
                    child: Column(
                      children: const [OverlayLoginType()],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: const Text(
                      "Desarrollado por:ADN Training S.A.S",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

//------------------------------------------------------------------------------
//---------------------------------Checkbox-------------------------------------
//------------------------------------------------------------------------------
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color.fromRGBO(107, 107, 107, 1);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

//------------------------------------------------------------------------------
//---------------------------------Formulario-----------------------------------
//------------------------------------------------------------------------------
int passedUserType = 0;

class OverlayLoginType extends StatefulWidget {
  const OverlayLoginType({Key? key}) : super(key: key);

  @override
  State<OverlayLoginType> createState() => _OverlayLoginTypeState();
}

class _OverlayLoginTypeState extends State<OverlayLoginType> {
  //------------------------------------------------------------------------------
  void PermaIsolate() async {
    try //
    {
      Timer.periodic(const Duration(seconds: 60), (_) async {
        //Creo un puerto que recive el mensaje del isolate Spwan
        ReceivePort ReceivePortMain = ReceivePort();
        //Creo el isolate spawn con la funcion Deamon y le mando mi puerto de escucha
        //para que el me envie mensajes de vuelta
        Isolate.spawn<SendPort>(Deamon, ReceivePortMain.sendPort);
        //agarro el send port que me envia el spawn isolate
        SendPort spawnIsolateSendPort = await ReceivePortMain.first;
        //Puerto para que me responda el spawn isolate
        ReceivePort spawnIsolateResponseReceivePort = ReceivePort();
        //Mensaje que le envio al spawn isolate (Toca encarle el send port para que me responda)
        spawnIsolateSendPort.send([
          correo.text,
          contrasena.text,
          spawnIsolateResponseReceivePort.sendPort
        ]);
        //Una variable que guarda la respuesta del spawn isolate
        final respuesta_del_spawn_isolate =
            await spawnIsolateResponseReceivePort.first;

        TituloNotidicacion = respuesta_del_spawn_isolate[0];
        MensajeNotificacion = respuesta_del_spawn_isolate[1];
        LinkNotificacion = respuesta_del_spawn_isolate[2];
        TNA1 = respuesta_del_spawn_isolate[3];
        MNA1 = respuesta_del_spawn_isolate[4];
        LNA1 = respuesta_del_spawn_isolate[5];
        TNA2 = respuesta_del_spawn_isolate[6];
        MNA2 = respuesta_del_spawn_isolate[7];
        LNA2 = respuesta_del_spawn_isolate[8];
        TNA3 = respuesta_del_spawn_isolate[9];
        MNA3 = respuesta_del_spawn_isolate[10];
        LNA3 = respuesta_del_spawn_isolate[11];
        TNA4 = respuesta_del_spawn_isolate[12];
        MNA4 = respuesta_del_spawn_isolate[13];
        LNA4 = respuesta_del_spawn_isolate[14];

        LLamarNotificacion1();
        LLamarNotificacion2();
        LLamarNotificacion3();
        LLamarNotificacion4();

        setState(() {});

        print(respuesta_del_spawn_isolate);
      });
    } on IsolateSpawnException catch (e) //
    {
      print(e);
    }
  }

  @override
  void initState() {
    Provider.of<Notificar>(context, listen: false).inicializar();
    super.initState();
  }

  @override
  void dispose() //
  {
    super.dispose();
  }

  bool isHiddenPassword = true;
  bool isVisibility = false;
  //------------------------------------------------------------------------------
  void singIn(email, password) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    var correofinal = email.text.toString();
    var passwordfinal = password.text.toString();

    try {
      var request = http.Request('POST', urlPostLogin);
      request.bodyFields = {'email': correofinal, 'password': passwordfinal};
      request.headers.addAll(headers1);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) //
      {
        print(await response.stream.bytesToString());
        pedirDatos(correofinal, passwordfinal);
      } else //
      {
        print(response.reasonPhrase);

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    "Por favor verifica que todos los campos esten correctos",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // cerrar loading circle
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cerrar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ));
      }
    } catch (e) {
      print(e);
    }
  }

  void pedirDatos(email, password) async {
    try {
      var request = http.Request('POST', urlPostProfile);
      request.bodyFields = {'email': email, 'password': password};
      request.headers.addAll(headers1);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var json = await response.stream.bytesToString();
        var jsn = jsonDecode(json);
        namebase = jsn['nombre'];
        puntosbase = jsn['puntos'];
        Ranking(
          email,
          password,
        );
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  void Ranking(email, password) async {
    try //
    {
      var request = http.Request('POST', urlPostRanking);
      request.bodyFields = {'email': email, 'password': password};
      request.headers.addAll(headers1);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) //
      {
        topbase = await response.stream.bytesToString();
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));

        //
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  //------------------------------------------------------------------------------
  void clearText() {
    correo.clear();
    contrasena.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 25),
            child: const Text(
              "Inicio de Sesión",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(97, 96, 96, 1)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _userTextField(),
          const SizedBox(
            height: 10,
          ),
          _passwordTextField(),
          Container(
              padding: const EdgeInsets.only(left: 10, top: 0),
              child: Stack(
                children: [
                  Row(children: [
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: const MyStatefulWidget()),
                    Container(
                      padding: const EdgeInsets.only(left: 0),
                      child: const Text(
                        "Recordar contraseña",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(117, 117, 117, 1)),
                      ),
                    )
                  ])
                ],
              )),
          _bottonLogin(),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Text(
              "¿Haz olvidado la contraseña ?",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(107, 107, 107, 1)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  /// User TextField ------------------------------------------------

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: correo,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo',
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 5,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  /// crear campo de texto contraseña ---------------------------------------

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: contrasena,
          keyboardType: TextInputType.emailAddress,
          obscureText: isHiddenPassword,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 5,
            ),
            suffixIcon: InkWell(
              onTap: _togglePassworView,
              child: Icon(
                isHiddenPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  /// mostrar contraseña ---------------------------------------

  void _togglePassworView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  /// crear boton Login ---------------------------------------

  Widget _bottonLogin() {
    return Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: ElevatedButton(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: const [
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            primary: const Color.fromRGBO(17, 140, 216, 1),
          ),
          onPressed: () {
            singIn(correo, contrasena);
            PermaIsolate();
          },
        ));
  }
}
