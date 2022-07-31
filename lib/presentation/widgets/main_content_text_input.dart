import 'package:flutter/material.dart';

class MainContentTextInput extends StatelessWidget {
  const MainContentTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      maxLines: 10,
      minLines: 10,
      decoration: InputDecoration(
        labelText: 'Вставьте текст',
        labelStyle: TextStyle(
          color: Colors.red[400]
        ),
        hintText: 'Просто вставьте текст и вновь скопируйте его...',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red[400]!,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onChanged: (String inputValue) {

      },
    );
  }
}
