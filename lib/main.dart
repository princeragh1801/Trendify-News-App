import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trendify_the_news_app/firebase_options.dart';
import 'package:trendify_the_news_app/screens/splash.dart';
import 'package:trendify_the_news_app/utils/util.dart';

late Size size;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trendify',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Utils.primaryColor),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true, titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black))
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
