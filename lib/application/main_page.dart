import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/description_content_state.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';
import 'package:replacer_pro/presentation/pages/main_content_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainContentState>(
          create: (_) => MainContentState(),
        ),
        ChangeNotifierProvider<DescriptionContentState>(
          create: (_) => DescriptionContentState(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Букварь PRO',
        home: MainContentPage(),
      ),
    );
  }
}
