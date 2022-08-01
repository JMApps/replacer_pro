import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replacer_pro/domain/state/provider/description_content_state.dart';
import 'package:replacer_pro/domain/state/provider/main_content_state.dart';

class MainContentButtons extends StatelessWidget {
  const MainContentButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          label: const Text(
            'Вставить',
            style: TextStyle(color: Colors.grey),
          ),
          icon: const Icon(
            CupertinoIcons.add_circled,
            color: Colors.grey,
          ),
          onPressed: () {
            FlutterClipboard.paste().then(
              (value) {
                context.read<MainContentState>().getCurrentMainContent(value);
                context.read<MainContentState>().getMainContentInputTextController.text = value;
                if (value.isNotEmpty) {
                  _showSnackMessage(context, Colors.grey, 'Вставлено из буфера обмена');
                }
              },
            );
          },
          style: TextButton.styleFrom(
            primary: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        TextButton.icon(
          label: const Text(
            'Применить',
            style: TextStyle(color: Colors.teal),
          ),
          icon: const Icon(
            CupertinoIcons.arrow_right_arrow_left_circle,
            color: Colors.teal,
          ),
          onPressed: () {
            switch (context.read<MainContentState>().getDropDownValue) {
              case 'Обычный текст':
                // check
                context.read<MainContentState>().getDefaultContent;
                break;
              case 'nользоваmельсkuũ':
                context.read<MainContentState>().replaceVarTwoText();
                break;
              case 'ńóл৮ჳóᏰãmęл৮ċќuũ':
                context.read<MainContentState>().replaceVarThreeText();
                break;
              case 'Текст невидимка':
                context.read<MainContentState>().replaceVarFourText();
                break;
              default:
                'Обычный текст';
            }
            if (context.read<MainContentState>().getDefaultContent.isNotEmpty &&
                context.read<MainContentState>().getDefaultContent != null) {
              if (context.read<DescriptionContentState>().getIsDescription &&
                  context.read<DescriptionContentState>().getDescriptionValue.isNotEmpty) {
                FlutterClipboard.copy(
                    '${context.read<MainContentState>().getDefaultContent}\n\n'
                    '${context.read<DescriptionContentState>().getDescriptionValue}');
                _showSnackMessage(context, Colors.teal, 'Преобразовано и скопировано');
              } else {
                FlutterClipboard.copy(
                    context.read<MainContentState>().getDefaultContent);
                _showSnackMessage(context, Colors.teal, 'Преобразовано и скопировано');
              }
            }
          },
          style: TextButton.styleFrom(
            primary: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.teal),
            ),
          ),
        ),
        TextButton.icon(
          label: const Text(
            'Очистить',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          icon: const Icon(
            CupertinoIcons.clear_circled,
            color: Colors.red,
          ),
          onPressed: () {
            if (context.read<MainContentState>().getDefaultContent.isNotEmpty) {
              context.read<MainContentState>().getMainContentInputTextController.clear();
              context.read<MainContentState>().getCurrentMainContent('');
              _showSnackMessage(context, Colors.red, 'Очищено');
            }
          },
          style: TextButton.styleFrom(
            primary: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  _showSnackMessage(BuildContext context, Color color, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        duration: const Duration(milliseconds: 1250),
      ),
    );
  }
}
