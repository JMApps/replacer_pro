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
        activeColor: Colors.red[400],
        value: context.watch<DescriptionContentState>().getIsDescription,
        onChanged: (bool onChanged) {
          context.read<DescriptionContentState>().changeSwitchDescription(onChanged);
        },
      ),
      title: TextFormField(
        controller: context.watch<DescriptionContentState>().getDescriptionContentInputTextController,
        enabled: context.watch<DescriptionContentState>().getIsDescription,
        autofocus: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        minLines: 1,
        decoration: InputDecoration(
          labelText: context.watch<DescriptionContentState>().getIsDescription ? 'Добавить подпись' : 'Подпись отключена',
          labelStyle: TextStyle(color: Colors.red[400]),
          hintText: 'Ссылки, хештеги и пр...',
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
