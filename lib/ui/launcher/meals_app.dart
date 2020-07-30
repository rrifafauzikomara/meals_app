import 'package:flutter/material.dart';
import 'package:mealsapp/ui/home/home_page.dart';
import 'package:mealsapp/ui/launcher/app_config.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: Config.isDebug,
      title: Config.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
