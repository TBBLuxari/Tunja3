// ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use
import 'package:adn_training/views/Login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

String uno = "1";

class Notificar extends ChangeNotifier {
  //Instanciar
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //Inicializar
  Future inicializar() async {
    tz.initializeTimeZones();
  }

  //Notificacion con imagen

  Future HrNotificacion1() async {
    //General
    FlutterLocalNotificationsPlugin localNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    //Android
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings(
            "tunja"); //icono que sale en la barrita , no en la notificacion
    //Ios
    IOSInitializationSettings iosInitializationSettings =
        const IOSInitializationSettings(); //por ahora no icono para ios
    //Llamar la inicializacion
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await localNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: escribirMensaje1);

    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("imagencontenido3"),
        largeIcon: DrawableResourceAndroidBitmap("iconnoti"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(0, TNA1, MNA1,
        tz.TZDateTime.now(tz.local).add(Duration(minutes: TT1)), platform,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future HrNotificacion2() async {
    //General
    FlutterLocalNotificationsPlugin localNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    //Android
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings(
            "tunja"); //icono que sale en la barrita , no en la notificacion
    //Ios
    IOSInitializationSettings iosInitializationSettings =
        const IOSInitializationSettings(); //por ahora no icono para ios
    //Llamar la inicializacion
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await localNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: escribirMensaje2);

    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("imagencontenido1"),
        largeIcon: DrawableResourceAndroidBitmap("iconnoti"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(1, TNA2, MNA2,
        tz.TZDateTime.now(tz.local).add(Duration(hours: TT2)), platform,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future HrNotificacion3() async {
    //General
    FlutterLocalNotificationsPlugin localNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    //Android
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings(
            "tunja"); //icono que sale en la barrita , no en la notificacion
    //Ios
    IOSInitializationSettings iosInitializationSettings =
        const IOSInitializationSettings(); //por ahora no icono para ios
    //Llamar la inicializacion
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await localNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: escribirMensaje3);

    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("imagencontenido2"),
        largeIcon: DrawableResourceAndroidBitmap("iconnoti"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(2, TNA3, MNA3,
        tz.TZDateTime.now(tz.local).add(Duration(hours: TT3)), platform,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future HrNotificacion4() async {
    //General
    FlutterLocalNotificationsPlugin localNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    //Android
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings(
            "tunja"); //icono que sale en la barrita , no en la notificacion
    //Ios
    IOSInitializationSettings iosInitializationSettings =
        const IOSInitializationSettings(); //por ahora no icono para ios
    //Llamar la inicializacion
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await localNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: escribirMensaje4);
    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("imagencontenido"),
        largeIcon: DrawableResourceAndroidBitmap("iconnoti"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(3, TNA4, MNA4,
        tz.TZDateTime.now(tz.local).add(Duration(hours: TT4)), platform,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future cancelNotificacion() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void escribirMensaje1(String? n) //
  {
    //var url = LNA3 + "?user=" + correo;
    //https://adntra.herokuapp.com/index.html
    //https://game-qa.adntraining.com.co/PruebaPushTrainingTunja/index.html
    var url = LNA1 + "?user=" + correo.text;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: inApp,
          enableJavaScript: true,
        );
      }
    }

    reinicar = false;
    openBrowserURL(url: url, inApp: false);
    HrNotificacion2();
  }

  void escribirMensaje2(String? n) //
  {
    //var url = LNA3 + "?user=" + correo;
    //https://adntra.herokuapp.com/index.html
    //https://game-qa.adntraining.com.co/PruebaPushTrainingTunja/index.html
    var url = LNA2 + "?user=" + correo.text;
    ;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: inApp,
          enableJavaScript: true,
        );
      }
    }

    openBrowserURL(url: url, inApp: false);
    HrNotificacion3();
  }

  void escribirMensaje3(String? n) //
  {
    //var url = LNA3 + "?user=" + correo;
    //https://adntra.herokuapp.com/index.html
    //https://game-qa.adntraining.com.co/PruebaPushTrainingTunja/index.html
    var url = LNA3 + "?user=" + correo.text;
    ;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: inApp,
          enableJavaScript: true,
        );
      }
    }

    openBrowserURL(url: url, inApp: false);
    HrNotificacion4();
  }

  void escribirMensaje4(String? n) //
  {
    //var url = LNA3 + "?user=" + correo;
    //https://adntra.herokuapp.com/index.html
    //https://game-qa.adntraining.com.co/PruebaPushTrainingTunja/index.html
    var url = LNA4 + "?user=" + correo.text;
    ;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: inApp,
          enableJavaScript: true,
        );
      }
    }

    reinicar = true;
    openBrowserURL(url: url, inApp: false);
  }
}
