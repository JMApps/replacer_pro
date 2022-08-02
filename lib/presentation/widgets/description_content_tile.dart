import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/description_content_state.dart';

class DescriptionContentTile extends StatelessWidget {
  const DescriptionContentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      trailing: Switch.adaptive(
        activeColor: Colors.blue,
        value: context.watch<DescriptionContentState>().getIsDescription,
        onChanged: (bool onChanged) {
          context.read<DescriptionContentState>().changeSwitchDescription(onChanged);
        },
      ),
      title: TextFormField(
        autofocus: false,
        autocorrect: false,
        keyboardType: TextInputType.text,
        controller: context.watch<DescriptionContentState>().getDescContentInputTextController,
        enabled: context.watch<DescriptionContentState>().getIsDescription,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          label: Text(context.watch<DescriptionContentState>().getIsDescription ? 'Добавьте подпись' : 'Подпись отключена'),
          hintText: 'Ссылки, хештеги и пр...',
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
          context.read<DescriptionContentState>().getDescriptionContent(value!);
        },
      ),
    );
  }
}
