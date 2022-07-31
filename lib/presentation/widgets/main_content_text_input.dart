import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';

class MainContentTextInput extends StatelessWidget {
  const MainContentTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: context.watch<MainContentState>().getMainContentInputTextController,
        autofocus: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        maxLines: 10,
        minLines: 10,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Добавьте текст',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color: Colors.red[400],
          ),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          hintText: 'Напишите текст или просто вставьте скопированный и вновь скопируйте его...',
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.red[200],
          ),
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
      ),
    );
  }
}
