import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ft_worldstreet/views/main_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/storage/local_storage.dart';
import 'core/utils/navigator.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppCache.init(); //Initialize Hive
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, builder) => MaterialApp(
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          home: MainLayout(),
          navigatorKey: AppNavigator.navKey,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
