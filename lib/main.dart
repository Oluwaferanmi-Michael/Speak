import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:speak/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/Util/Theme/screen_util.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true
  );
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtil(

      builder: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Speak',
        routerConfig: router,
        /// refer to the routes page for [initial page]
      ),
    );
  }
}
