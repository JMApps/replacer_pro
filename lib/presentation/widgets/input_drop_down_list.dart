import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';
import 'package:replacer_pro/domain/theme/app_theme.dart';

class InputDropDownList extends StatelessWidget {
  const InputDropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 8,
        right: 16,
      ),
      child: Center(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(15),
          alignment: Alignment.center,
          dropdownColor: Theme.of(context).colorScheme.dropDownBackgroundColor,
          elevation: 3,
          value: context.watch<MainContentState>().getDropDownValue,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          onChanged: (String? newValue) {
            context.read<MainContentState>().changeDropDownValue(newValue!);
          },
          items: [
            'Обычный текст',
            'nользоваmельсkuũ',
            'ńóл৮ჳóᏰãmęл৮ċќuũ',
            'Текст невидимка'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.dropDownItemBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
