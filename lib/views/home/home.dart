// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:adn_training/views/Login/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
//import 'ejemplo.dart';

var headers1 = {'Content-Type': 'application/x-www-form-urlencoded'};
final urlPostLogout = Uri.parse("https://vozai.herokuapp.com/Logout");

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void LogOut(email, passwrod) async {
      var correofinal = email.text.toString();
      var passwordfinal = passwrod.text.toString();

      try {
        var request = http.Request('POST', urlPostLogout);
        request.bodyFields = {'email': correofinal, 'password': passwordfinal};
        request.headers.addAll(headers1);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login()));
        } else {
          print(response.reasonPhrase);
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: Color.fromRGBO(36, 60, 129, 1.0),
            ),
          ),
          actions: [
            Image.asset(
              "assets/imagenes/Losos.png",
              width: 82,
              height: 82,
            ),
            Image.asset(
              "assets/imagenes/vacio.png",
              width: 20,
              height: 20,
            ),
          ],
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: Color.fromRGBO(17, 140, 216, 100),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.star),
            label: 'Puntaje',
            backgroundColor: Color.fromRGBO(17, 140, 216, 100),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Cuenta',
            backgroundColor: Color.fromRGBO(17, 140, 216, 100),
          ),
        ]),
        body: ListView(
          children: [
            Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
///////////// Carruserl /////////////////////////////////////////////
                  Container(
                    width: double.infinity,
                    height: 130,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0.0, 1.0),
                          colors: [
                            Color.fromRGBO(36, 60, 129, 1.0),
                            Color.fromRGBO(32, 183, 234, 1.0)
                          ]),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Participantes programa",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CarouselSlider(
                        items: [
                          Image.asset(
                            "assets/imagenes/ADN.png",
                          ),
                          Image.asset("assets/imagenes/Tunja.png"),
                          Image.asset("assets/imagenes/Secretaria.png"),
                          Image.asset("assets/imagenes/ActivaT.png"),
                          Image.asset("assets/imagenes/Fenalco.png")
                        ],
                        options:
                            CarouselOptions(autoPlay: true, aspectRatio: 5),
                      ),
                    ]),
                  ),
////////////  Texto ///////////////////////////////////////7
                  Container(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0)),
                          Text("¡Hola",
                              style: GoogleFonts.poppins(
                                  fontSize: 24, fontWeight: FontWeight.normal)),
                          Text(namebase,
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromRGBO(12, 140, 216, 1.0))),
                          Text("!",
                              style: GoogleFonts.poppins(
                                  fontSize: 24, fontWeight: FontWeight.normal)),
                        ],
                      )),
///////////// imagen puntos /////////////////////////
                  Container(
                      width: 350,
                      height: 400,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/imagenes/puntos.png"),
                          ),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 15.0,
                            )
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 100, top: 260),
                                child: Text(
                                  "Puntos:",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 40, top: 260),
                                child: Text(
                                  "Top°:",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 100),
                                child: Text(
                                  puntosbase.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 70),
                                child: Text(
                                  topbase.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ])
          ],
        ));
  }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
/*Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            LogOut(correo, contrasena);
          },
          icon: const Icon(
            FontAwesomeIcons.arrowRightFromBracket,
            color: Color.fromRGBO(36, 60, 129, 1.0),
          ),
        ),
        actions: [
          Image.asset(
            "assets/imagenes/Losos.png",
            width: 82,
            height: 82,
          ),
          Image.asset(
            "assets/imagenes/vacio.png",
            width: 20,
            height: 20,
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //////////// Text Inicial ///////////////
              Row(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(18, 30, 0, 40)),
                  Text("¡Hola",
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.normal)),
                  Text(namebase,
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(12, 140, 216, 1.0))),
                  Text("!",
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.normal)),
                ],
              ),
              //////////// Imagen Box //////////////////////////
              Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                        )
                      ]),
                  child: Image.asset("assets/imagenes/puntos.png"),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 210),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 120,
                            ),
                            Text(
                              "Puntos:",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Top°:",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 120,
                            ),
                            Text(
                              puntosbase.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              topbase.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ))
              ]),
              ////////////// Espacio de 24 ///////
              const SizedBox(
                height: 30,
              ),
              //////////// Container azul ///////////////////////
              Container(
                margin: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 1.0),
                      colors: [
                        Color.fromRGBO(36, 60, 129, 1.0),
                        Color.fromRGBO(32, 183, 234, 1.0)
                      ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(top: 15),
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Participantes programa",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.only(bottom: 40, top: 20),
                      child: CarouselSlider(
                        items: [
                          Image.asset(
                            "assets/imagenes/ADN.png",
                            width: 260,
                          ),
                          Image.asset(
                            "assets/imagenes/Tunja.png",
                            width: 250,
                          ),
                          Image.asset(
                            "assets/imagenes/Secretaria.png",
                            width: 300,
                          ),
                          Image.asset(
                            "assets/imagenes/ActivaT.png",
                            width: 260,
                          ),
                          Image.asset(
                            "assets/imagenes/Fenalco.png",
                            width: 230,
                          )
                        ],
                        options: CarouselOptions(
                            autoPlay: true, aspectRatio: 8, pageSnapping: true),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
          backgroundColor: Color.fromRGBO(17, 140, 216, 100),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.star),
          label: 'Puntaje',
          backgroundColor: Color.fromRGBO(17, 140, 216, 100),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: 'Cuenta',
          backgroundColor: Color.fromRGBO(17, 140, 216, 100),
        ),
      ]),
    );*/
