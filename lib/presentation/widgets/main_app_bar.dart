import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: const Text('Букварь PRO'),
      backgroundColor: Colors.red[400],
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.info),
          splashRadius: 20,
          onPressed: () {},
        ),
      ],
    );
  }
}