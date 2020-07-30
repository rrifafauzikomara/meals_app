import 'package:flutter/material.dart';
import 'package:mealsapp/ui/launcher/app_config.dart';

import 'meals_app.dart';

void main() {
  Config.appFlavors = Flavors.DEVELOPMENT;
  runApp(MyApp());
}
