// ignore_for_file: avoid_print, non_constant_identifier_names, deprecated_member_use
import 'package:adn_training/views/Login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notificar extends ChangeNotifier {
  //Instanciar
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //Inicializar
  Future inicializar() async {
    // //General
    // FlutterLocalNotificationsPlugin localNotificationsPlugin =
    //     FlutterLocalNotificationsPlugin();
    // //Android
    // AndroidInitializationSettings androidInitializationSettings =
    //     const AndroidInitializationSettings(
    //         "tunja"); //icono que sale en la barrita , no en la notificacion
    // //Ios
    // IOSInitializationSettings iosInitializationSettings =
    //     const IOSInitializationSettings(); //por ahora no icono para ios
    // //Llamar la inicializacion
    // final InitializationSettings initializationSettings =
    //     InitializationSettings(
    //         android: androidInitializationSettings,
    //         iOS: iosInitializationSettings);

    // await localNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: escribirMensaje);

    tz.initializeTimeZones();
  }

  //Notificacion con imagen
  Future INotificacion() async {
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
        onSelectNotification: escribirMensaje);

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("icon426x240"),
        largeIcon: DrawableResourceAndroidBitmap("icon72x72"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.show(
      0,
      TituloNotidicacion,
      MensajeNotificacion,
      platform,
    );
  }

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
        onSelectNotification: CNA1);

    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("icon426x240"),
        largeIcon: DrawableResourceAndroidBitmap("icon72x72"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(0, TNA1, MNA1,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 25)), platform,
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
        onSelectNotification: CNA2);

    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("icon426x240"),
        largeIcon: DrawableResourceAndroidBitmap("icon72x72"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        TituloNotidicacion,
        MNA2,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 35)),
        platform,
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
        onSelectNotification: CNA3);

    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("icon426x240"),
        largeIcon: DrawableResourceAndroidBitmap("icon72x72"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(2, TNA3, MNA3,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 45)), platform,
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
        onSelectNotification: CNA4);
    //Aqui toca poner lo del isolate y la base

    var bigPicture = const BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("icon426x240"),
        largeIcon: DrawableResourceAndroidBitmap("icon72x72"),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails("channelid", "channelname",
        styleInformation: bigPicture);
    var platform = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        TituloNotidicacion,
        MNA4,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 55)),
        platform,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future cancelNotificacion() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void escribirMensaje(String? payload) //
  {
    final url = LinkNotificacion;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) //
      {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: inApp,
          enableJavaScript: true,
        );
      }
    }

    openBrowserURL(url: url, inApp: false);
  }

  void CNA1(String? payload) //
  {
    final url = LNA1;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) //
      {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: true,
          enableJavaScript: true,
        );
      }
    }

    openBrowserURL(url: url, inApp: false);
  }

  void CNA2(String? payload) //
  {
    final url = LNA2;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) //
      {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: true,
          enableJavaScript: true,
        );
      }
    }

    openBrowserURL(url: url, inApp: false);
  }

  void CNA3(String? payload) //
  {
    final url = LNA3;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) //
      {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: true,
          enableJavaScript: true,
        );
      }
    }

    openBrowserURL(url: url, inApp: false);
  }

  void CNA4(String? payload) //
  {
    final url = LNA4;
    print(url);
    Future openBrowserURL({
      required String url,
      bool inApp = false,
    }) async {
      if (await canLaunch(url)) //
      {
        await launch(
          url,
          forceSafariVC: inApp,
          forceWebView: true,
          enableJavaScript: true,
        );
      }
    }

    openBrowserURL(url: url, inApp: false);
  }
}
