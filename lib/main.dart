import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:replacer_pro/application/main_page.dart';
import 'package:replacer_pro/domain/constants.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(Constants.keyMainAddedContent);
  runApp(
    const MainPage(),
  );
}
