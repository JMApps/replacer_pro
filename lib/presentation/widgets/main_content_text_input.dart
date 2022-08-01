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
        autocorrect: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        maxLines: 7,
        minLines: 5,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Добавьте текст',
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          hintText: 'Напишите текст или просто вставьте скопированный и преобразуйте его...',
          hintStyle: const TextStyle(
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onChanged: (String? value) {
          context.read<MainContentState>().getCurrentMainContent(value!);
        },
      ),
    );
  }
}
