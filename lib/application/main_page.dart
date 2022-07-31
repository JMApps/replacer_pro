import 'package:flutter/material.dart';
import 'package:replacer_pro/presentation/pages/main_content_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Букварь PRO',
      home: MainContentPage(),
    );
  }
}
