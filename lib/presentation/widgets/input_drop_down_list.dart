import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';

class InputDropDownList extends StatelessWidget {
  const InputDropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      width: double.maxFinite,
      child: Center(
        child: DropdownButton(
          value: context.watch<MainContentState>().getDropDownValue,
          elevation: 0,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
          ),
          underline: Container(
            width: double.maxFinite,
            color: Colors.green,
          ),
          onChanged: (String? newValue) {
            context.read<MainContentState>().changeDropDownValue(newValue!);
          },
          items: ['Обычный текст', 'nользоваmельсkuũ', 'ńóл৮ჳóᏰãmęл৮ċќuũ', 'Текст невидимка']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                color: Colors.red[50]!,
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
