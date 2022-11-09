import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/utils/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'data/network/api_client.dart';
import 'data/pref/app_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPref().isPreferenceReady;

  // enable app must in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<StreamSubscription> _streams = [];

  var locales = [
    const Locale('en', ''),
    const Locale('ar', ''),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver;
    _internetAvailability();
    debugPrint(
        "------------------>>>>>>>>>>>>${Get.deviceLocale!.languageCode}");
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _streams) {
      element.cancel();
    }
    WidgetsBinding.instance.removeObserver;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, builder) => GetMaterialApp(
        initialRoute: AppRouter.splashScreen,
        getPages: AppRouter.getPages,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: (AppPref().isDark ? ThemeMode.dark : ThemeMode.light),
        locale: Locale(AppPref().languageCode),
      ),
    );
  }

  _internetAvailability() async {
    _streams.add(Connectivity()
        .onConnectivityChanged
        .listen((event) => _checkInternetStatus(event)));
    if (GetPlatform.isIOS) {
      _checkInternetStatus(await Connectivity().checkConnectivity());
    }
  }

  _checkInternetStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isInternetAvailable = false;
    } else {
      isInternetAvailable = await DataConnectionChecker().hasConnection;
    }
  }
}
