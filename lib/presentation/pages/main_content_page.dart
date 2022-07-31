import 'package:flutter/material.dart';
import 'package:replacer_pro/presentation/widgets/main_app_bar.dart';
import 'package:replacer_pro/presentation/widgets/main_content_text_input.dart';

class MainContentPage extends StatelessWidget {
  const MainContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: MainAppBar(),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: MainContentTextInput(),
          ),
        ],
      ),
    );
  }
}
